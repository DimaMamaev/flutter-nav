import 'package:flutter/material.dart';
import 'package:menuApp/components/main-drawer/main-drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings-screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget switcher(
    String title,
    bool value,
    String subtitle,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Adjust your meals selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: [
              switcher(
                  'Gluten free', _glutenFree, 'Include only gluten free meals',
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              switcher('Vegan', _vegan, 'Include only vegan meals', (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
              switcher(
                  'Vegeterian', _vegetarian, 'Include only vegeterian meals',
                  (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
              switcher('Lactose free', _lactoseFree,
                  'Include only lactose free meals', (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
            ]),
          )
        ],
      ),
    );
  }
}
