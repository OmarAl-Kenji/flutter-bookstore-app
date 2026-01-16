import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myapp/models/purchasedBook.dart';
import 'package:myapp/StartPages/loginpage.dart';

class ProfilePage extends StatefulWidget {
  final String Name;
  final String Pass;
  final String Email;

  const ProfilePage({
    super.key,
    required this.Name,
    required this.Pass,
    required this.Email,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String userName;
  late String userEmail;

  late Box<PurchasedBook> purchasedBox;
  List<PurchasedBook> purchasedBooks = [];

  @override
  void initState() {
    super.initState();
    userName = widget.Name;
    userEmail = widget.Email;
    loadPurchasedBooks();
  }

  void loadPurchasedBooks() {
    final box = Hive.box<PurchasedBook>('purchasedBooks');
    final allPurchased = box.values.toList();

    setState(() {
      purchasedBooks =
          allPurchased.where((book) => book.userEmail == userEmail).toList();
    });
  }

  void _logout() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB1732E),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: Colors.white
          ,),
            tooltip: 'Log out',
            onPressed: _logout,
          ),
        ],
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFFB1732E),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userEmail,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30), 
            const Text(
              'Purchased Books',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child:
                  purchasedBooks.isEmpty
                      ? const Center(child: Text("No books purchased yet."))
                      : ListView.separated(
                        itemCount: purchasedBooks.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final book = purchasedBooks[index];
                          return ListTile(
                            leading: const Icon(
                              Icons.book,
                              color: Color(0xFFB1732E),
                            ),
                            title: Text(
                              book.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              '${book.quantity} x \$${book.price.toStringAsFixed(2)}',
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
