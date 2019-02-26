import 'package:flutter/material.dart';
import 'screens/home_cupertino.dart';
import 'screens/home_material.dart';
import 'screens/home_custom.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms Demo',
      home: HomeMaterial(),
      // home: HomeCupertino(),
    );
  }
}
