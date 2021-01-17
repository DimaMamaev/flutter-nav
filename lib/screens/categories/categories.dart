import 'package:flutter/material.dart';

import 'package:menuApp/components/category-item/category-item.dart';
import 'package:menuApp/data/data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: GridView(
          children: DATA_CATEGORIES
              .map((element) => CategoryItem(
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
