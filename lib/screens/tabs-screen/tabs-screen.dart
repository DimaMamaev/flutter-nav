import 'package:flutter/material.dart';
import 'package:menuApp/screens/categories/categories.dart';
import 'package:menuApp/screens/favorites/favorites.dart';

class TabScreen extends StatefulWidget {
  static final String routeName = '/';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _routes = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  int _selectedRouteIndex = 0;

  void _selectorHandler(int index) {
    setState(() {
      _selectedRouteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes[_selectedRouteIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectorHandler,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedIconTheme: IconThemeData(color: Colors.black),
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _selectedRouteIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
                size: 30,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.star_border_outlined,
                size: 30,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
