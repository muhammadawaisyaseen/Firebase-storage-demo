// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String nameOfItem;
  String quantityOfItem;
  String image;
  Product({
    required this.nameOfItem,
    required this.quantityOfItem,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameOfItem': nameOfItem,
      'quantityOfItem': quantityOfItem,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      nameOfItem: map['nameOfItem'] as String,
      quantityOfItem: map['quantityOfItem'] as String,
      image: map['image'] as String,
    );
  }
}
