import 'package:flutter/material.dart';
import 'package:shop/models/item.dart';

class Cart {
  String id;
  Item item;
  int quantity;

  Cart({required this.id, required this.item, required this.quantity});
}

class CartProvider with ChangeNotifier {
  List<Cart> _items = [];

  List<Cart> get items {
    return [..._items];
  }

  double get totalPrice {
    return _items.fold(0, (total, row) {
      return (total as double) + (row.item.price * row.quantity);
    });
  }

  void addItem(Item item) {
    if (_items.where((row) => row.item == item).length > 0) {
      _items.firstWhere((element) => element.item == item).quantity++;
    } else {
      _items.add(Cart(id: DateTime.now().toString(), item: item, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(Cart cart) {
    _items.remove(cart);
    notifyListeners();
  }
}
