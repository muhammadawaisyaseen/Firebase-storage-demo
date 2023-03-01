// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore v = FirebaseFirestore.instance;
  String collection = 'shopppingList';
  add(Datas x) async {
    try {
      await v.collection(collection).doc().set(x.toMap());
      print('chala ha ');
    } catch (e) {
      print(e.toString());
    }
  }
}

class Datas {
  final String name;
  final String quantity;
  final String imageurl;
  Datas({
    required this.name,
    required this.quantity,
    required this.imageurl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'imageurl': imageurl,
    };
  }

  factory Datas.fromMap(Map<String, dynamic> map) {
    return Datas(
      name: map['name'] as String,
      quantity: map['quantity'] as String,
      imageurl: map['imageurl'] as String,
    );
  }
}
