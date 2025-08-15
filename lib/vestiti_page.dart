import 'package:flutter/material.dart';
import 'package:apparel/data/dress_database.dart';
import 'package:provider/provider.dart';
import 'package:apparel/add_dress_page.dart';
import 'dart:io';

class VestitiPage extends StatefulWidget {
  const VestitiPage({super.key});

  @override
  State<VestitiPage> createState() => _VestitiPageState();
}

class _VestitiPageState extends State<VestitiPage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<DressDatabase>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('La Mia Collezione di Vestiti')),
      body: StreamBuilder<List<DressData>>(
        stream: database.getDresses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Initial state, still waiting for the first data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error occurred
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // No data received or list is empty
            return const Center(
              child: Text('No dresses in your collection yet. Add some!'),
            );
          } else {
            final dresses = snapshot.data!;
            return ListView.builder(
              itemCount: dresses.length,
              itemBuilder: (context, index) {
                final dress = dresses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Sostituito l'Image.network con una SizedBox
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: Image.file(
                              File(dress.imageUrl),
                              fit: BoxFit.cover, // Or other fit as needed
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dress.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Colore: ${dress.color}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDressPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
