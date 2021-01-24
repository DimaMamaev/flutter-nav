import 'package:flutter/material.dart';
import 'package:menuApp/components/meal-item/meal-item.dart';
import 'package:menuApp/data/data.dart';
import 'package:menuApp/models/meals.dart';

class MealsScreen extends StatefulWidget {
  static const String routeName = '/meals-screen';

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Map<String, String> widgetArgs;
  List<Meal> filteredMealsById;

  @override
  void didChangeDependencies() {
    widgetArgs = ModalRoute.of(context).settings.arguments;

    filteredMealsById = DATA_MEALS.where((meal) {
      return meal.categories.contains(widgetArgs['id']);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      filteredMealsById.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetArgs['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsItem(
                id: filteredMealsById[index].id,
                title: filteredMealsById[index].title,
                imageUrl: filteredMealsById[index].imageUrl,
                duration: filteredMealsById[index].duration,
                affordability: filteredMealsById[index].affordability,
                complexity: filteredMealsById[index].complexity,
                removeItem: _removeMeal);
          },
          itemCount: filteredMealsById.length,
        ),
      ),
    );
  }
}
