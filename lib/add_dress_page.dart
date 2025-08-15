import 'dart:io';
import 'package:flutter/material.dart';
import 'package:apparel/data/dress_database.dart';
import 'package:provider/provider.dart';
import 'package:apparel/services/photo_service.dart';

//TODO: risolvere freeze con op asincrone, 
//controllare bene che i path siano giusti (anche nel service), 
//come viene presa l'immagine nel vestiti page,
//pensare al db

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
                child:
                    (_dressPhoto == null)
                        ? const Icon(
                          Icons.camera_alt,
                          size: 80,
                          color: Colors.grey,
                        )
                        : Image.file(_dressPhoto!, fit: BoxFit.cover),
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

              // Take Photo Button
              ElevatedButton.icon(
                onPressed: () async {
                  _dressPhoto =
                      await Provider.of<PhotoService>(context, listen: false).takePhoto();
                  if (_dressPhoto != null) {
                    setState(() {
                      // Update the state to reflect that a photo has been taken.
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No photo taken')),
                    );
                  }
                },
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Take Dress Photo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              //SaveButton
              ElevatedButton.icon(
                onPressed: () async{
                  //controlliamo che tutto sia compilato
                  if (_nameController.text.isEmpty ||
                      _colorController.text.isEmpty ||
                      _dressPhoto == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please fill all fields and take a photo',
                        ),
                      ),
                    );
                    return;
                  }

                  final dressFileName =
                      "${_nameController.text}_${_colorController.text}_${DateTime.now().toString()}";
                  final dressFilePath =
                      "img"; //TODO: format this advancedly later

                  //SAVING THE PHOTO
                  await Provider.of<PhotoService>(context, listen: false).savePhoto(
                    imgFolderPathString: dressFilePath,
                    imgName: dressFileName,
                    photoFile: _dressPhoto!,
                  );

                  //SAVING TO DB
                  Provider.of<DressDatabase>(context, listen: false)
                      .insertDressFromData(
                        name: _nameController.text,
                        color: _colorController.text,
                        imageUrl: "$dressFilePath/$dressFileName.jpg",
                      )
                      .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Dress saved successfully'),
                          ),
                        );
                        Navigator.pop(context); // Go back to the previous page.
                      })
                      .catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error saving dress: $error')),
                        );
                      });
                },

                icon: const Icon(Icons.save),
                label: const Text('Save Dress'),
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
