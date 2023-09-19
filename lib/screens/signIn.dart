import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  List<Color> _backgroundColors = [
    Color(0xFF63A69F), // Teal
    Color(0xFFF29492), // Salmon
    Color(0xFFE7C3B6), // Peach
  ]; // Gradient background colors
  int _currentColorIndex = 0; // Current background color index

  void _signIn(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Authentication failed. Please try again."),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _changeBackgroundColor() {
    setState(() {
      _currentColorIndex =
          (_currentColorIndex + 1) % _backgroundColors.length; // Change background color index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 2), // Color transition duration
              curve: Curves.easeInOut, // Easing curve
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _backgroundColors, // Gradient background colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent card background
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.7), // Border color
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                          labelStyle: TextStyle(color: Colors.black), // Text color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple, // Focused border color
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple, // Enabled border color
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email.';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.lock),
                          labelStyle: TextStyle(color: Colors.black), // Text color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple, // Focused border color
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple, // Enabled border color
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password.';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                      SizedBox(height: 20),
                      _isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () => _signIn(context),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black, // Text color
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, // Transparent button
                                shadowColor: Colors.transparent, // No button shadow
                                side: BorderSide(
                                  color: Colors.black.withOpacity(0.7), // Border color
                                  width: 2,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
