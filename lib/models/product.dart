// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String uid;
  String nameOfItem;
  String quantityOfItem;
  String image;
  Product({
    required this.uid,
    required this.nameOfItem,
    required this.quantityOfItem,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid':uid,
      'nameOfItem': nameOfItem,
      'quantityOfItem': quantityOfItem,
      'image': image,
    };
  }

  factory Product.fromMap(DocumentSnapshot<Map<String, dynamic>> mydoc) {
    return Product(
      uid: mydoc.data()?['uid']??'',
      nameOfItem: mydoc.data()?['nameOfItem'] as String,
      quantityOfItem: mydoc.data()?['quantityOfItem'] as String,
      image: mydoc.data()?['image'] as String,
    );
  }
}