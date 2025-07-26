import 'package:flutter/material.dart';
import 'package:apparel/vestitiPage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:         
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VestitiPage()),
              );
            },
            child: Text("Vestiti"),
          ),
        
      
    );
  }
}
