import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = '/meals-screen';
  @override
  Widget build(BuildContext context) {
    final widgetArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetArgs['title']),
      ),
      body: Center(
        child: Text('Meals Page!'),
      ),
    );
  }
}
