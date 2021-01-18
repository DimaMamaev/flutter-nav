import 'package:flutter/material.dart';
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
            return Text(filteredMealsById[index].title);
          },
          itemCount: filteredMealsById.length,
        ),
      ),
    );
  }
}
