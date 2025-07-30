import 'package:flutter/material.dart';
import 'package:apparel/vestiti_page.dart';
import 'package:apparel/data/dress_database.dart';

class IntroPage extends StatelessWidget {
  final DressDatabase dbToPassDown;

  const IntroPage({super.key, required this.dbToPassDown});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => VestitiPage(database: this.dbToPassDown),
                    ),
                  );
                },
                child: Text("Vestiti"),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Nav to other page
                },
                child: Text("Outfit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
