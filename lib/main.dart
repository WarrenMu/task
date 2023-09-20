import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/firebase_options.dart';
import 'package:task/screens/signIn.dart';
import 'package:task/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Set the initial route to the splash screen
      routes: {
        '/splash': (context) => SplashScreen(), // Route to SplashScreen
        '/signIn': (context) => SignInScreen(),
      },
    );
  }
}
