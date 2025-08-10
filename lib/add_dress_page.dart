import 'dart:io';
import 'package:flutter/material.dart';

// The main page widget, which contains the form and camera button.
class AddDressPage extends StatefulWidget {
  const AddDressPage({super.key});

  @override
  State<AddDressPage> createState() => _AddDressPageState();
}

class _AddDressPageState extends State<AddDressPage> {
  // Controllers for the text input fields.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  // Variable to hold the dress photo file, it's nullable initially.
  // This will be used later to display the taken picture.
  File? _dressPhoto;

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the widget tree.
    _nameController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Dress')),
      body: SingleChildScrollView(
        // Use a padding widget to provide some space around the form elements.
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Placeholder for the dress photo.
              // This will be replaced by an actual image file once a photo is taken.
              Container(
                height: 200,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(
                  Icons.camera_alt,
                  size: 80,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Input field for the dress name with a controller.
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Dress Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input field for the dress color with a controller.
              TextFormField(
                controller: _colorController,
                decoration: const InputDecoration(
                  labelText: 'Dress Color',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              // Button to take a picture of the dress.
              // The onPressed function is left empty for now.
              ElevatedButton.icon(
                onPressed: () {
                  // This is where the camera logic will go.
                },
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Take Dress Photo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
