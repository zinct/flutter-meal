import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/item_data.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/widgets/home/home_item.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('Happy Shopping!'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Order'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('MyShop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Badge(
                showBadge: value.items.isNotEmpty,
                badgeContent: Text(value.items.length.toString()),
                position: BadgePosition.bottomStart(bottom: 25, start: 25),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 5 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: items
              .map(
                (e) => ChangeNotifierProvider.value(
                  value: e,
                  child: HomeItem(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
