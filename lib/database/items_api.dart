import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_example/models/product.dart';


class ItemsApi {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static const String _collection = 'shopping_list';
  void addItem(Product p) async {
    try {
      await _instance.collection(_collection).doc(p.uid).set(p.toMap());
    } catch (e) {
      print(e.hashCode);
    }
  }
}
