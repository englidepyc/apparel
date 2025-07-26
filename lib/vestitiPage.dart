import 'package:flutter/material.dart';

class VestitiPage extends StatelessWidget {
  const VestitiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vestiti')),
      body: Center(child: const Text('Questa è la pagina dei vestiti')),
    );
  }
}
