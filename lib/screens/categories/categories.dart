import 'dart:math';

import 'package:flutter/material.dart';

import 'package:menuApp/components/category-item/category-item.dart';
import 'package:menuApp/data/data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: GridView(
          padding: EdgeInsets.all(15),
          children: DATA_CATEGORIES
              .map((element) => CategoryItem(
                    id: element.id,
                    title: element.title,
                    color: element.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
