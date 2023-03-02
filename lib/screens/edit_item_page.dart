import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_example/models/product.dart';
import 'package:flutter/material.dart';

class EdidItemPage extends StatelessWidget {
  EdidItemPage({required this.uid, super.key});
  final String uid;
  final collectionInstance =
      FirebaseFirestore.instance.collection('shopping_list');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
// when the user typing data, our _textControllerListener function constantly will send data in database
  Future<void> updateData() async {
    String nameText = _nameController.text;
    String quantityText = _quantityController.text;
    await collectionInstance.doc(uid).update({
      'nameOfItem': nameText,
      'quantityOfItem': quantityText,
    });
  }
  // ------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Item'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          // setupTextControllerListner();
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                    'Enter the text in below fields to update the taped data'),
                Divider(color: Colors.grey),
                TextField(
                  controller: _nameController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration:
                      const InputDecoration(hintText: 'Enter name of item'),
                ),
                TextField(
                  controller: _quantityController,
                  enableSuggestions: true,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: 'Enter quantity of item'),
                ),
                ElevatedButton(
                  onPressed: () async{
                    await updateData();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
