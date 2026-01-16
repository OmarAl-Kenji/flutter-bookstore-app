import 'package:flutter/material.dart';
import '../secondpage.dart';
import 'package:google_fonts/google_fonts.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/firstimage.png', 
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  'Reading Community\n\t       Get Started',
                      style: GoogleFonts.inter(
                           fontSize: 20,
                           fontWeight: FontWeight.w500, 
                           color: Colors.white,
                 )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
