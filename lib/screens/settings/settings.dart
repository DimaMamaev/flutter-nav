import 'package:flutter/material.dart';

import '../../components/main-drawer/main-drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings-screen';
  final Function saveSettingsHandler;
  final Map<String, bool> filters;

  SettingsScreen(this.filters, this.saveSettingsHandler);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _vegan = widget.filters['lactose'];
    _vegetarian = widget.filters['vegan'];
    _lactoseFree = widget.filters['vegeterian'];
    super.initState();
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt_rounded),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegetarian,
              };
              widget.saveSettingsHandler(selectedFilters);
            },
          )
        ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'To save filters press:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        child: Icon(
                          Icons.save_alt_rounded,
                          size: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          final selectedFilters = {
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                            'vegan': _vegan,
                            'vegeterian': _vegetarian,
                          };
                          widget.saveSettingsHandler(selectedFilters);
                        },
                      )),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
