import 'package:flutter/material.dart';

import '../../data/data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static final String routeName = '/meals-details';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DATA_MEALS.firstWhere((meal) => meal.id == mealId);

    final appBar = AppBar(
      title: Text(selectedMeal.title),
    );

    final double systemComponentsWidth = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    Widget sectionTitle(String title, BuildContext ctx) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
        ),
      );
    }

    Widget containerWrapper(BuildContext ctx, List<String> iterable) {
      return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(ctx).accentColor),
            borderRadius: BorderRadius.circular(15)),
        height: systemComponentsWidth * 0.3,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return SingleChildScrollView(
              child: Card(
                color: Theme.of(ctx).primaryColorLight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${index + 1}. ${iterable[index]}',
                  ),
                ),
              ),
            );
          },
          itemCount: iterable.length,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: systemComponentsWidth * 0.4,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle('Ingridients', context),
            containerWrapper(context, selectedMeal.ingredients),
            sectionTitle('Steps', context),
            containerWrapper(context, selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_forever_rounded),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
