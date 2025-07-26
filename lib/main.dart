import 'package:flutter/material.dart';
import 'package:apparel/introPage.dart';

// 1. Define a StatelessWidget for the main application entry point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppArel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroPage(), // Our main page where the action happens
    );
  }
}

