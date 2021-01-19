import 'package:flutter/material.dart';
import 'package:menuApp/components/meal-item/meal-item.dart';
import 'package:menuApp/data/data.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = '/meals-screen';
  @override
  Widget build(BuildContext context) {
    final widgetArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final filteredMealsById = DATA_MEALS.where((meal) {
      return meal.categories.contains(widgetArgs['id']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetArgs['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsItem(
                title: filteredMealsById[index].title,
                imageUrl: filteredMealsById[index].imageUrl,
                duration: filteredMealsById[index].duration,
                affordability: filteredMealsById[index].affordability,
                complexity: filteredMealsById[index].complexity);
          },
          itemCount: filteredMealsById.length,
        ),
      ),
    );
  }
}
