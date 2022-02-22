import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants.dart';
import 'package:shop/data/item_data.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/product_provider.dart';
import 'package:shop/widgets/home/home_item.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildDrawer(context) {
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
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Product'),
            onTap: () {
              Navigator.of(context).pushNamed(ROUTE.manageProduct);
            },
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
        title: const Text(APP.name),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Badge(
                showBadge: value.items.isNotEmpty,
                badgeContent: Text(value.items.length.toString()),
                position: BadgePosition.bottomStart(bottom: 25, start: 25),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ROUTE.cart);
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          print("BUILDING");
          return Container(
            margin: EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 5 / 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: value.item
                  .map(
                    (e) => ChangeNotifierProvider.value(
                      value: e,
                      child: HomeItem(),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
