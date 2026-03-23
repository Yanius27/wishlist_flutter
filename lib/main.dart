import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';
import 'pages/about.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/kate_wishes': (context) => Home(name: 'Катя', wishes: ['Dress', 'Parfum', 'Ring'],),
      '/yan_wishes': (context) => Home(name: 'Ян', wishes: ['Nintendo switch', 'Book', 'Puppy']),
      '/about': (context) => About(),
    },
  ));
}