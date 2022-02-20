import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  String name;
  String image;
  bool isFavorite = false;
  double price = 0;

  Item({required this.name, required this.image, required this.price});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
