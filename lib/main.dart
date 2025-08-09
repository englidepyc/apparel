import 'package:apparel/data/dress_database.dart';
import 'package:flutter/material.dart';
import 'package:apparel/intro_page.dart';
import 'package:drift/drift.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(
    Provider<DressDatabase>(
      create: (_) => DressDatabase(),
      dispose: (_, db) => db.close(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppArel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IntroPage(),
    );
  }
}
