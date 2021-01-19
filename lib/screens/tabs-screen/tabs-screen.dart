import 'package:flutter/material.dart';
import 'package:menuApp/components/main-drawer/main-drawer.dart';
import 'package:menuApp/screens/categories/categories.dart';
import 'package:menuApp/screens/favorites/favorites.dart';

class TabScreen extends StatefulWidget {
  static final String routeName = '/';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _routes = [
    {
      'page': CategoriesScreen(),
      'title': 'Menu',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your favorites',
    },
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
      appBar: AppBar(
        title: Text(_routes[_selectedRouteIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _routes[_selectedRouteIndex]['page'],
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
