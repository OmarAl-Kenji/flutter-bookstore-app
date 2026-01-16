import 'package:flutter/material.dart';
import 'book_data.dart';
import 'book_details_page.dart';

class DramaCategory extends StatefulWidget {
  const DramaCategory({super.key});

  @override
  State<DramaCategory> createState() => _DramaCategory();
}

class _DramaCategory extends State<DramaCategory> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredBooks =
        books.where((book) => book.category == 'Drama').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drama'
        ,style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB1732E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetailsPage(book: book),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              book.imagePath,
                              width: 80,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                book.author,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$${book.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Color(0xFFB1732E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
