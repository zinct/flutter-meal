import 'package:flutter/material.dart';
import 'package:meal_menu/screens/categories_screen.dart';
import 'package:meal_menu/screens/favorites_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Your Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
