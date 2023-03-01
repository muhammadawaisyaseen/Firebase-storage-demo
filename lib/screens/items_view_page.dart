import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_example/constants/routes.dart';
import 'package:firebase_storage_example/models/product.dart';
import 'package:flutter/material.dart';

class ItemsViewPage extends StatelessWidget {
  ItemsViewPage({super.key});

// List<Product> myProduct = [];

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
            
            // print(querySnapshot);
            // print(querySnapshot!.docs);
            // querySnapshot.docs;
            // List<QueryDocumentSnapshot> document = querySnapshot!.docs;
            // print(document);
            // document.add
            return ListView.builder(
              itemCount: document.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                       title: Text(document[index]['nameOfItem']),
                      // subtitle: Text(snapshot.data?.docs[index]['quantityOfItem']),
                      // leading: Container(
                      //     child:
                      //         Image.network(snapshot.data?.docs[index]['image'])),
                      ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
      // ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return const ListTile(
      //       title: Text('Awais'),
      //       subtitle: Text('2'),
      //     );
      //   },
      // ),
    );
  }
}
