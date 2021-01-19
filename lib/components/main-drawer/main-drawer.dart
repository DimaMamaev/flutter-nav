import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildMenuItem(String title, IconData iconName) {
    return ListTile(
      leading: Icon(
        iconName,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Colors.black,
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          buildMenuItem('Meals', Icons.restaurant_menu_outlined),
          buildMenuItem('Settings', Icons.settings_applications_outlined),
        ],
      ),
    );
  }
}
