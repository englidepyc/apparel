import 'package:flutter/material.dart';
import 'package:apparel/data/dress_database.dart';
import 'package:provider/provider.dart';

// Pagina principale per visualizzare la lista dei vestiti
class VestitiPage extends StatefulWidget {

  const VestitiPage({super.key});

  @override
  State<VestitiPage> createState() => _VestitiPageState();
}

class _VestitiPageState extends State<VestitiPage> {
  /*TODO: Metodo per aggiungere un nuovo vestito alla lista
  void _addDress(Dress newDress) {
    setState(() {
      _dresses.add(newDress);
    });
  }
  */

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
                            child: Image.asset(
                              '${dress.imageUrl}',
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
          /* TODO: Implementa la logica per aggiungere un nuovo vestito
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDressPage(onAdd: _addDress),
            ),
          ); */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
// Pagina per aggiungere un nuovo vestito
class AddDressPage extends StatefulWidget {
  final Function(Dress) onAdd;

  const AddDressPage({super.key, required this.onAdd});

  @override
  State<AddDressPage> createState() => _AddDressPageState();
}

class _AddDressPageState extends State<AddDressPage> {
  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submitDress() {
    if (_nameController.text.isEmpty ||
        _colorController.text.isEmpty ||
        _imageUrlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Per favore, compila tutti i campi.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final newDress = Dress(
      name: _nameController.text,
      color: _colorController.text,
      imageUrl: _imageUrlController.text,
    );
    widget.onAdd(newDress);
    Navigator.pop(context); // Torna alla pagina precedente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi un Nuovo Vestito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome Vestito',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(
                labelText: 'Colore',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'URL Immagine',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submitDress,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Aggiungi Vestito'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
