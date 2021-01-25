import 'package:flutter/material.dart';
import './data/data.dart';
import './models/meals.dart';

import './screens/meals-details/meals-details.dart';
import './screens/meals/meals.dart';
import './screens/settings/settings.dart';
import './screens/tabs-screen/tabs-screen.dart';

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
  List<Meal> _favoritesData = [];

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

  void _toggleFavorites(String mealId) {
    final checkIndex = _favoritesData.indexWhere((meal) => meal.id == mealId);
    if (checkIndex >= 0) {
      setState(() {
        _favoritesData.removeAt(checkIndex);
      });
    } else {
      setState(() {
        _favoritesData.add(DATA_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoritesData.any((meal) => meal.id == mealId);
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
              headline5: TextStyle(
                fontSize: 20,
              ),
              headline6: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ))),
      routes: {
        TabScreen.routeName: (context) => TabScreen(_favoritesData),
        MealsScreen.routeName: (context) => MealsScreen(_mealsData),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(
              favoritesHandler: _toggleFavorites,
              isFavorite: _isFavorite,
            ),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(_filters, _filterHandler),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen(_favoritesData));
      },
    );
  }
}
