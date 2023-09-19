import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/firebase_options.dart';
import 'package:task/screens/add_note.dart';
import 'package:task/screens/home.dart';
import 'package:task/screens/signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signIn',
      routes: {
        '/signIn': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
        '/addNote': (context) => AddNoteScreen(),
      },
    );
  }
}
