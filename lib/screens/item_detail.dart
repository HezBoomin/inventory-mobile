import 'package:flutter/material.dart';
import 'package:inventory/models/items.dart';
// Import your item model

class ItemDetailPage extends StatelessWidget {
  final Item item; // Pass the selected item to the page

  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          tooltip: 'Go back to item list',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.fields.name}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 5),
            Text(
              'Amount: ${item.fields.amount}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Description: ${item.fields.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Categories: ${item.fields.categories}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Date Added: ${item.fields.dateAdded}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
