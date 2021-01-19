import 'package:flutter/material.dart';
import 'package:menuApp/models/meals.dart';

class MealsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealsItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityString {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  void onSelectHandler() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectHandler,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10),
                      topRight: const Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.white60,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityString)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityString)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
