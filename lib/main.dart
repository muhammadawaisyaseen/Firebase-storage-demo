import 'package:firebase_storage_example/constants/routes.dart';
import 'package:firebase_storage_example/screens/add_items_page.dart';
import 'package:firebase_storage_example/screens/items_view_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemsViewPage(),
      routes: {
        addItemsRoute: (context) => AddItemsPage(),
        itemsViewRoute: (context) => ItemsViewPage(),
      },
    );
  }
}
