import 'dart:io';

import 'package:firebase_storage_example/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
class AddItemsPage extends StatelessWidget {
  AddItemsPage({super.key});

  final TextEditingController _nameOfItem = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  String imageUrl = '';
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
              onPressed: () async {
                // 1)
                //capture an image (image_picker)
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.camera);
                print('${file?.path}');
                if (file == null) return;
                // 2)
                // upload an image to firebase storage(Even before uploading a file
                //we have to create the reference of the file to be uploaded)

                String uniqueFileName = DateTime.now().microsecond.toString();

                //Get a reference of storage root
                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');

                //create the reference for a image to be stored
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName);

                try {
                  // 2.1) store the file(image) to firebase
                  await referenceImageToUpload.putFile(File(file!.path));
                  // 3) get download url of image
                  imageUrl= await referenceImageToUpload.getDownloadURL();
                } catch (error) {}

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
