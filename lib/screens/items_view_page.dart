import 'package:firebase_storage_example/constants/routes.dart';
import 'package:flutter/material.dart';

class ItemsViewPage extends StatelessWidget {
  const ItemsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(addItemsRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Awais'),
            subtitle: Text('2'),
          );
        },
      ),
    );
  }
}
