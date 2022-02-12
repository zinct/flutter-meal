import 'package:flutter/material.dart';
import 'package:meal_menu/screens/categories_screen.dart';
import 'package:meal_menu/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
