import 'package:flutter/material.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/utils/route_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      routes: appRoute,
    );
  }
}
