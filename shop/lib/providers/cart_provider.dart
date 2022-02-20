import 'package:flutter/material.dart';
import 'package:shop/models/item.dart';

class CartProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  double get totalPrice {
    return _items.fold(0, (total, row) {
      return (total as double) + row.price;
    });
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
