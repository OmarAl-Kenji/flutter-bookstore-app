import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/book.dart';
import 'package:myapp/models/purchasedBook.dart';

class CartPage extends StatefulWidget {
  final String userEmail;
  const CartPage({super.key, required this.userEmail});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Box<CartBook> cartBox;

  @override
  void initState() {
    super.initState();
    cartBox = Hive.box<CartBook>('cartBox');
  }

  List<CartBook> get cartItems => cartBox.values.toList();

  double get totalPrice {
    return cartItems.fold(0, (sum, book) => sum + book.price * book.quantity);
  }

  void increaseQuantity(int index) {
    final book = cartBox.getAt(index);
    if (book != null) {
      book.quantity++;
      book.save();
      setState(() {});
    }
  }

  void decreaseQuantity(int index) {
    final book = cartBox.getAt(index);
    if (book != null && book.quantity > 1) {
      book.quantity--;
      book.save();
      setState(() {});
    }
  }

  void removeItem(int index) {
    cartBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: const Color(0xFFB1732E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child:
            cartBox.isEmpty
                ? const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18),
                  ),
                )
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartBox.length,
                        itemBuilder: (context, index) {
                          final book = cartBox.getAt(index)!;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        book.imageAssetPath,
                                        width: 80,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            'Price: \$${book.price.toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => removeItem(index),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Color(0xFFB1732E),
                                          ),
                                          onPressed:
                                              () => decreaseQuantity(index),
                                        ),
                                        Text(
                                          '${book.quantity}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Color(0xFFB1732E),
                                          ),
                                          onPressed:
                                              () => increaseQuantity(index),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total: \$${totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB1732E),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                final userPurchasedBox =
                                    Hive.box<PurchasedBook>('purchasedBooks');

                              
                                for (var cartItem in cartItems) {
                                  final purchasedBook = PurchasedBook(
                                    title: cartItem.title,
                                    imageAssetPath: cartItem.imageAssetPath,
                                    price: cartItem.price,
                                    quantity: cartItem.quantity,
                                    userEmail:
                                        widget.userEmail,
                                  );
                                  await userPurchasedBox.add(purchasedBook);
                                }

                            
                                await cartBox.clear();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Checkout complete! Your cart is now empty.',
                                    ),
                                  ),
                                );

                                setState(() {});
                              } catch (e) {
                                print('Error during checkout: $e');
                              }
                            },

                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
