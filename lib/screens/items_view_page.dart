import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_example/constants/routes.dart';
import 'package:firebase_storage_example/models/product.dart';
import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

class ItemsViewPage extends StatelessWidget {
  ItemsViewPage({super.key});

  final myFirestoreItems =
      FirebaseFirestore.instance.collection('shopping_list');

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
      body: StreamBuilder(
        stream: myFirestoreItems.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? querySnapshot = snapshot.data;
            List<Product> product = [];
            for (DocumentSnapshot<Map<String, dynamic>> e
                in querySnapshot!.docs) {
              product.add(Product.fromMap(e));
            }
            return ListView.builder(
              // itemCount: products.length,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(product[index].nameOfItem),
                  subtitle: Text(product[index].quantityOfItem),
                  leading: Image.network(product[index].image),
                  trailing: IconButton(
                      onPressed: () {
                        myFirestoreItems.doc(product[index].uid).delete();
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
