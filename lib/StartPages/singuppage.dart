import 'package:myapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../homepage.dart';
import 'package:flutter/gestures.dart';
import 'loginpage.dart';
import '../box.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String Sname = '';
  String Spass = '';
  String Semail = '';

  TextEditingController SnameController = TextEditingController();
  TextEditingController SpassController = TextEditingController();
  TextEditingController SemailController = TextEditingController();

  bool isobscure = true;
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fill Your Information Below Or Register\nWith Your Social Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 163, 162, 162),
                ),
              ),
              SizedBox(height: 18),
              // Name Filed
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  controller: SnameController,
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(color: Color(0xFF999797)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Email
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  controller: SemailController,
                  decoration: InputDecoration(
                    hintText: 'Ahmad12@gmail.com',
                    hintStyle: TextStyle(color: Color(0xFF999797)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Password
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  controller: SpassController,
                  obscureText: isobscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Color(0xFF999797)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isobscure = !isobscure;
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (SnameController.text.isEmpty ||
                        SpassController.text.isEmpty ||
                        SemailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill All Fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      setState(() {
                        Sname = SnameController.text;
                        Spass = SpassController.text;
                        Semail = SemailController.text;
                      });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HomePage(
                              name1: Sname,
                              email1: Semail,
                              pass1: Spass,
                            ),
                      ),
                    );
                    setState(() {
                      BoxUSER.put(
                        'K_$Sname',
                        User(
                          Fname: Sname,
                          Fpassword: Spass,
                          Femail: Semail,
                          Fid: [],
                        ),
                      );
                    });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB1732E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Divider + text
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or Sign Up With",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.black)),
                ],
              ),
              SizedBox(height: 20),

              // Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.facebookF),
                    color: Color(0xFF3b5998),
                    iconSize: 25,
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.google),
                    color: Color.fromARGB(255, 219, 55, 55),
                    iconSize: 25,
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Color(0xFF1DA1F2),
                    iconSize: 25,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Login Text
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have An Account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFFB1732E),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
