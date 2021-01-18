import 'package:flutter/material.dart';

import 'package:menuApp/screens/categories/categories.dart';
import 'package:menuApp/screens/meals/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu application',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'HindSiliguri',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ))),
      routes: {
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        MealsScreen.routeName: (context) => MealsScreen(),
      },
    );
  }
}
