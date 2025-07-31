import 'package:apparel/data/dress_database.dart';
import 'package:flutter/material.dart';
import 'package:apparel/intro_page.dart';
import 'package:drift/drift.dart';

// 1. Define a StatelessWidget for the main application entry point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DressDatabase database;

  @override
  void initState() {
    super.initState();
    database = DressDatabase();
    //In via eccezionale per la semplicità, inzializzo qualche valore qui
    List<DressCompanion> base_dresses = [
      DressCompanion(
        color: Value('Bianco'),
        name: Value("Maglietta Ellesse"),
        imageUrl: Value("assets/test_images/maglietta_coopculture.jpg"),
      ),
      DressCompanion(
        color: Value('Grigio'),
        name: Value("Pantalone nero"),
        imageUrl: Value("assets/test_images/pantalone_nero.jpg"),
      ),
      DressCompanion(
        color: Value('Bianco'),
        name: Value("Polo Coopculture"),
        imageUrl: Value("assets/test_images/maglietta_coopculture.jpg"),
      ),
    ];

    _initialList(base_dresses);
  }

  Future<void> _initialList(List<DressCompanion> list) async {
    //controlla se vuoto
    var count = await database.getDresses().first;
    if (count.isEmpty) {
      for (DressCompanion d in list) {
        await database.insertDress(d);
      }
    }
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppArel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroPage(
        dbToPassDown: database,
      ), // Our main page where the action happens
    );
  }
}
