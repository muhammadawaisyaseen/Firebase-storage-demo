import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_example/constants/routes.dart';
import 'package:firebase_storage_example/database/items_api.dart';
import 'package:firebase_storage_example/models/product.dart';
import 'package:flutter/material.dart';

import 'edit_item_page.dart';

class ItemsViewPage extends StatelessWidget {
  ItemsViewPage({super.key});

  // final myFirestoreItems =
  //     FirebaseFirestore.instance.collection('shopping_list');

  final storageRef = FirebaseStorage.instance.ref();
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
      body: StreamBuilder<List<Product>>(
        stream: ItemsApi().retrieveData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> product = snapshot.data ?? [];
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EdidItemPage(
                            uid: product[index].uid.toString(),
                          );
                        },
                      ),
                    );
                  },
                  title: Text(product[index].nameOfItem),
                  subtitle: Text((product[index].quantityOfItem).toString()),
                  leading: Image.network(product[index].image.toString()),
                  trailing: IconButton(
                    onPressed: () async {
                      // myFirestoreItems.doc(product[index].uid).delete();
                      await ItemsApi().deleteItem(product[index].uid);
                      // await FirebaseStorage.instance
                      //     .refFromURL(product[index].image)
                      //     .delete();
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
