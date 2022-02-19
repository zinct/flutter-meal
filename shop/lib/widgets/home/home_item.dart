import 'package:flutter/material.dart';
import 'package:shop/models/item.dart';

class HomeItem extends StatelessWidget {
  final Item item;

  const HomeItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Icon(
                Icons.favorite,
                color: Colors.white,
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
        child: Center(
          child: Text(
            item.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
