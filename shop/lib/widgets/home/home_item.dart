import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/providers/cart_provider.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);

    return GridTile(
      child: Image.network(
        item.image,
        fit: BoxFit.cover,
      ),
      header: Container(
        height: 50,
        child: Stack(
          children: [
            Positioned(
              right: 8,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  Provider.of<Item>(context, listen: false).toggleFavorite();
                },
                child: Icon(
                  Icons.favorite,
                  color: item.isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      footer: Container(
        height: 40,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, .8),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addItem(item);
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
