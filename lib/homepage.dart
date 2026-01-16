import 'package:flutter/material.dart';
import 'package:myapp/cartpage.dart';
import 'package:myapp/drama_category.dart';
import 'package:myapp/history_category.dart';
import 'package:myapp/iterary_category.dart';
import 'package:myapp/medical_category.dart';
import 'package:myapp/mystery_category.dart';
import 'package:myapp/profilepage.dart';
import 'fantasy_category.dart';
import 'searchpage.dart';
import 'book_data.dart';
import 'book_details_page.dart';

class HomePage extends StatefulWidget {
  final String name1;
  final String pass1;
  final String email1;
  const HomePage({
    super.key,
    required this.name1,
    required this.pass1,
    required this.email1,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String Hname;
  late String Hpass;
  late String Hemail;
  void initState() {
    super.initState();
    Hname = widget.name1;
    Hpass = widget.pass1;
    Hemail = widget.email1;
  }

  //dart code
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ProfilePage(Name: Hname, Email: Hemail, Pass: Hpass),
        ),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage(userEmail: Hemail),
),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
            style: TextStyle(color: Colors.white, fontSize: 20),
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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 201, 201, 201),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              readOnly: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
                suffixIcon: Icon(Icons.camera_alt),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(book: books[15]),
                      ),
                    );
                  },
                  child: buildBookContainer(
                    buildBook(
                      'images/A_Thousand_Splendid_Suns_-_Khaled_Hosseini_Drama.jpg',
                      'A Thousand Splendid Suns',
                      'Khaled Hosseini',
                      '\$20.00',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(book: books[23]),
                      ),
                    );
                  },
                  child: buildBookContainer(
                    buildBook(
                      'images/When_Breath_Becomes_Air_-_Paul_Kalanithi_Medical.jpg',
                      'When Breath Becomes Air',
                      'Paul Kalanithi',
                      '\$15.00',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(book: books[9]),
                      ),
                    );
                  },
                  child: buildBookContainer(
                    buildBook(
                      'images/Gone_Girl_-_Gillian_Flynn_Mystery.jpg',
                      'Gone Girl',
                      'Gillian Flynn',
                      '\$18.00',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(book: books[28]),
                      ),
                    );
                  },
                  child: buildBookContainer(
                    buildBook(
                      'images/Life_of_Pi_-_Yann_Martel_Fantasy.jpg',
                      'Life_of_Pi',
                      'Yann Martel',
                      '\$22.00',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(book: books[16]),
                      ),
                    );
                  },
                  child: buildBookContainer(
                    buildBook(
                      'images/Memoirs_of_a_Geisha_-_Arthur_Golden_Drama.jpg',
                      'Memoirs of a Geisha',
                      'Arthur Golden',
                      '\$25.00',
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox(
              height: 200,
              child: GridView.count(
                childAspectRatio: 2.56,
                crossAxisCount: 3,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FantasyCategory(),
                        ),
                      );
                    },
                    child: buildCategory("Fantasy"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiteraryCategory(),
                        ),
                      );
                    },
                    child: buildCategory("Literary"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MysteryCategory(),
                        ),
                      );
                    },
                    child: buildCategory("Mystery"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalCategory(),
                        ),
                      );
                    },
                    child: buildCategory("Medical"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DramaCategory(),
                        ),
                      );
                    },
                    child: buildCategory("Drama"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryCategory(),
                        ),
                      );
                    },
                    child: buildCategory("History"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
         onTap: _onItemTapped,
         type: BottomNavigationBarType.fixed,
         backgroundColor: Color(0xFFB1732E),
         selectedItemColor: Colors.white,
         unselectedItemColor: Colors.white,
         showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
Widget buildBook(String imagePath, String title, String author, String price) {
  return SizedBox(
    width: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 110,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget buildCategory(String categoryName) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 201, 201, 201),
    ),
    child: Text(categoryName),
  );
}

Widget buildBookContainer(Widget child) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: child,
  );
}
