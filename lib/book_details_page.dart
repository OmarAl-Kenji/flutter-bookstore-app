import 'package:flutter/material.dart';
import 'package:myapp/book_data.dart' as data;
import 'package:myapp/models/book.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookDetailsPage extends StatelessWidget {
  final data.Book book;

  const BookDetailsPage({super.key, required this.book});

  Future<void> addToCart(data.Book book, BuildContext context) async {
    final box = Hive.box<CartBook>('cartBox');
    final existingIndex = box.values.toList().indexWhere((b) => b.title == book.title);

    if (existingIndex != -1) {
      final existingBook = box.getAt(existingIndex);
      if (existingBook != null) {
        existingBook.quantity++;
        await existingBook.save();
      }
    } else {
      await box.add(CartBook(
        title: book.title,
        imageAssetPath: book.imagePath,
        price: book.price,
        quantity: 1,
      ));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book.title} added to cart'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: const Color(0xFFB1732E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  book.imagePath,
                  width: 180,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                book.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'by ${book.author}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '\$${book.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF388E3C),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'About this book',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              book.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF555555),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => addToCart(book, context),
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB1732E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
