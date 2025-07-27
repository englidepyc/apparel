import 'package:flutter/material.dart';
import 'package:apparel/vestiti_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
                    MaterialPageRoute(builder: (context) => VestitiPage()),
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
