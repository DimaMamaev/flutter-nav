import 'package:flutter/material.dart';
import 'package:menuApp/data/data.dart';
import 'package:menuApp/models/meals.dart';

import 'package:menuApp/screens/meals-details/meals-details.dart';
import 'package:menuApp/screens/meals/meals.dart';
import 'package:menuApp/screens/settings/settings.dart';
import 'package:menuApp/screens/tabs-screen/tabs-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _mealsData = DATA_MEALS;

  void _filterHandler(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _mealsData = DATA_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        TabScreen.routeName: (context) => TabScreen(),
        MealsScreen.routeName: (context) => MealsScreen(_mealsData),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(_filters, _filterHandler),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}
