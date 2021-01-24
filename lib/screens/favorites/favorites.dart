import 'package:flutter/material.dart';

import '../../components/meal-item/meal-item.dart';
import '../../models/meals.dart';

class FavoritesScreen extends StatelessWidget {
  static final String routeName = '/favorites';

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    bool isEmpty = favoriteMeals.length == 0;
    print(isEmpty);

    return Center(
        child: !isEmpty
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealsItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                  );
                },
                itemCount: favoriteMeals.length,
              )
            : Text('Your favorite meals list is empty!'));
  }
}
