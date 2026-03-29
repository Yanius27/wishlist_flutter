import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';
import 'pages/about.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/wishes': (context) => Home(),
      '/about': (context) => About(),
    },
  ));
}