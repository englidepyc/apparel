import 'package:apparel/data/dress_database.dart';
import 'package:apparel/services/photo_service.dart';
import 'package:flutter/material.dart';
import 'package:apparel/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<DressDatabase>(
          create: (context) => DressDatabase(),
          dispose: (context, db) => db.close(),
        ),
        Provider<PhotoService>(create: (context) => PhotoService()),
      ],
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
