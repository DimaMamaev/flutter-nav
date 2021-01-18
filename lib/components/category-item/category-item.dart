import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void onRouteHandler(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/meals-screen", arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onRouteHandler(context),
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.65), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
