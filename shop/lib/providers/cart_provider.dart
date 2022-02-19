import 'package:flutter/material.dart';
import 'package:shop/models/item.dart';

class CartProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  void addItem(Item item) {
    _items.add(item);
    print(_items);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
