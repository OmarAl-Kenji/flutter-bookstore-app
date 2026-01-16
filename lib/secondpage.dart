import 'package:flutter/material.dart';
import 'package:myapp/StartPages/singuppage.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/secondimage.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Text(
              'Reading Is A Conversation\nAll Books Talk, But A Good Book Listens As Well',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 100,
            right: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB1732E),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'start reading',
                style: TextStyle(fontSize: 16, color:Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
