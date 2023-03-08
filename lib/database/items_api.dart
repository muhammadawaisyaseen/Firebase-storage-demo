import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_example/models/product.dart';

class ItemsApi {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static const String _collection = 'shopping_list';
  Future<void> addItem(Product p) async {
    try {
      await _instance.collection(_collection).doc(p.uid).set(p.toMap());
    } catch (e) {
      print(e.hashCode);
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _instance.collection(_collection).doc(id).delete();
    } catch (e) {
      print(e.hashCode);
    }
  }

  Future<void> updateItem(Product p) async {
    try {
      log('API: ${p.uid}');
      await _instance
          .collection(_collection)
          .doc(p.uid.trim())
          .update(p.updateItemInDb());
    } catch (e) {
      print('API: ERROR: ${e.toString()}');
    }
  }

  Stream<List<Product>> retrieveData() {
    return _instance.collection(_collection).snapshots().asyncMap((event) {
      List<Product> myItems = [];
      for (DocumentSnapshot<Map<String, dynamic>> element in event.docs) {
        myItems.add(Product.fromMap(element));
      }
      return myItems;
    });
  }
}
