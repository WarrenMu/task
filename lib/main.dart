import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:task/screens/home.dart';
import 'package:task/screens/signIn.dart';
import 'package:task/screens/splash.dart';

void main() => runApp(Phoenix(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(), // Use SplashScreen as the initial screen
      routes: {
        '/signIn': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
