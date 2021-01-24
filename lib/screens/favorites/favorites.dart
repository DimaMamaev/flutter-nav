import 'package:flutter/material.dart';
import 'package:menuApp/models/meals.dart';

class FavoritesScreen extends StatelessWidget {
  static final String routeName = '/favorites';

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Favorites screen'),
    );
  }
}
