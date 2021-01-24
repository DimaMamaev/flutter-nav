import 'package:flutter/material.dart';
import 'package:menuApp/components/main-drawer/main-drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('settings'),
      ),
    );
  }
}
