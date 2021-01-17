import 'package:flutter/material.dart';

import 'package:menuApp/screens/categories/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu application',
      home: CategoriesScreen(),
    );
  }
}
