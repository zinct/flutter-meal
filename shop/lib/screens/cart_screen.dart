import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            CartHeader(),
            CartBody(),
          ],
        ),
      ),
    );
  }
}

class CartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return Text(
                        'Rp. ${cart.totalPrice.toString()}',
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Order',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView(
        children: cart.items
            .map((e) => CartItem(
                  e,
                  key: ValueKey(e.id),
                ))
            .toList(),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Cart _cart;

  const CartItem(this._cart, {Key? key}) : super(key: key);

  void _handleDismissed(context) {
    Provider.of<CartProvider>(context, listen: false).removeItem(_cart);
  }

  @override
  Widget build(BuildContext context) {
    final Item _item = _cart.item;

    return Dismissible(
      key: ValueKey(_cart.id),
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.restore_from_trash,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This item will be removed from your cart'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(_).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(_).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      ),
      onDismissed: (_) => _handleDismissed(context),
      child: Card(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 30,
              backgroundImage: NetworkImage(_item.image),
            ),
            title: Text(_item.name),
            subtitle: Text('Rp. ${_item.price.toString()}'),
            trailing: Text('${_cart.quantity.toString()}x'),
          ),
        ),
      ),
    );
  }
}
