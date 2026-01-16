import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/box.dart';
import 'package:myapp/StartPages/singuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String Lemail = '';
  String Lpass = '';

  TextEditingController LemailController = TextEditingController();
  TextEditingController LpassController = TextEditingController();

  bool isobscure = true;
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/loginimage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: ListView(
                children: [
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
                      controller: LemailController,
                      decoration: InputDecoration(
                        hintText: 'Ahmad12@gmail.com',
                        hintStyle: TextStyle(color: Color(0xFF999797)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),

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
                      controller: LpassController,
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

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          Lemail = LemailController.text.trim();
                          Lpass = LpassController.text.trim();
                        });

                        if (Lemail.isEmpty || Lpass.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter both email and password',
                              ),
                            ),
                          );
                          return;
                        }

                        bool userFound = false;
                        String matchedName = '';

                        for (var key in BoxUSER.keys) {
                          final user = BoxUSER.get(key);
                          if (user != null && user.Femail.toLowerCase()==Lemail.toLowerCase() && user.Fpassword == Lpass) 
                          {
                            userFound = true;
                            matchedName = user.Fname;
                            break;
                          }
                        }

                        if (userFound) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HomePage(
                                    email1: Lemail,
                                    pass1: Lpass,
                                    name1: matchedName,
                                  ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  backgroundColor: const Color(0xFFB1732E),
                                  title: Text(
                                    'Login Failed',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Text(
                                    'Email or Password is incorrect.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB1732E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),

                  // Divider + text
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or Log In With",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.black),
                      ),
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
                  SizedBox(height: 12),

                  // Sign Up text
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t Have Any Account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
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
                                        builder: (context) => SignUpPage(),
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
        ],
      ),
    );
  }
}
