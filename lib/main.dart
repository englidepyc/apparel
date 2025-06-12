import 'package:flutter/material.dart';

// 1. Define a StatelessWidget for the main application entry point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppArel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddItemsPage(), // Our main page where the action happens
    );
  }
}

// 2. Create a StatefulWidget to manage the list of items
class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  // This is our data source for the list
  // We use a List to store the items, and initially it's empty.
  final List<String> _items = [];
  int _itemCount = 0; // To keep track of the number for new items

  // Method to add a new item to the list
  void _addItem() {
    setState(() {
      // setState triggers a rebuild of the widget tree,
      // reflecting the changes in _items
      _itemCount++;
      _items.add('Item No. $_itemCount');
      print('Added: Item No. $_itemCount'); // For debugging in console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Item List'),
      ),
      body: Column(
        // Column arranges children vertically
        children: <Widget>[
          // 3. The "Add" Button
          Padding(
            padding: const EdgeInsets.all(16.0), // Add some padding around the button
            child: SizedBox(
              width: double.infinity, // Make the button fill the width
              height: 50.0, // Give the button a fixed height
              child: ElevatedButton.icon(
                onPressed: _addItem, // Call our _addItem method when pressed
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add New Item',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
          // 4. The "RecyclerView" equivalent: ListView.builder
          // We use Expanded to make the ListView take up all remaining vertical space
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text('No items added yet. Tap "Add New Item"!'),
                  )
                : ListView.builder(
                    itemCount: _items.length, // How many items are in our list
                    itemBuilder: (BuildContext context, int index) {
                      // This function is called for each item that needs to be built
                      final String item = _items[index];
                      return Card( // Wrap each list item in a Card for better visuals
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        elevation: 4.0,
                        child: ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')), // A simple leading icon
                          title: Text(item),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                _items.removeAt(index); // Remove item on delete tap
                              });
                            },
                          ),
                          onTap: () {
                            // Optional: Handle tap on the item
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Tapped on: $item')),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}