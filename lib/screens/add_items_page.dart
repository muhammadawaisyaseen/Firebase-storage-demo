import 'package:firebase_storage_example/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItemsPage extends StatelessWidget {
  AddItemsPage({super.key});

  final TextEditingController _nameOfItem = TextEditingController();
  final TextEditingController _quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameOfItem,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: 'Enter name of item'),
            ),
            TextField(
              controller: _quantity,
              enableSuggestions: true,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(hintText: 'Enter quantity of item'),
            ),
            IconButton(
              onPressed: () {
                // capture an image (image_picker)
                  ImagePicker imagePicker = ImagePicker();
                  imagePicker.pickImage(source: ImageSource.camera);
                
                // upload an image to firebase storage
                // get the url of uploaded image
                // store url on firestore database corresponding to item
                // display data on ItemViewPage
              },
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
