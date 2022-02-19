import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  String name;
  String image;
  bool isFavorite = false;

  Item({required this.name, required this.image});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
