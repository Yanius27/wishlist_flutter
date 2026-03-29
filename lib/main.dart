import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';
import 'pages/about.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Добавили импорт

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Обновили инициализацию для поддержки всех платформ (в т.ч. Web)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
