import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/utils/route_util.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        errorColor: Colors.red,
      ),
      routes: appRoute,
    );
  }
}
