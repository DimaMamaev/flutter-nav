import 'package:flutter/material.dart';

import 'package:menuApp/screens/meals-details/meals-details.dart';
import 'package:menuApp/screens/meals/meals.dart';
import 'package:menuApp/screens/settings/settings.dart';
import 'package:menuApp/screens/tabs-screen/tabs-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                  headline6: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ))),
      routes: {
        TabScreen.routeName: (context) => TabScreen(),
        MealsScreen.routeName: (context) => MealsScreen(),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}
