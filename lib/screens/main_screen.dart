import 'package:flutter/material.dart';
import 'package:meal_menu/screens/categories_screen.dart';
import 'package:meal_menu/screens/favorites_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Map<String, Object>> _bodies = [
    {'screen': CategoriesScreen(), 'label': 'Search food'},
    {'screen': const FavoritesScreen(), 'label': 'Your favorites'},
  ];

  Widget buildDrawerHeader() {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 100,
      width: double.infinity,
      child: const Center(
        child: Text(
          'Cooking Yummy!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItems() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.food_bank),
          title: const Text('Find food.'),
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text('Your favorite foods.'),
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.close),
          title: const Text('Close'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bodies[_selectedIndex]['label'].toString()),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            buildDrawerHeader(),
            buildDrawerItems(),
          ],
        ),
      ),
      body: _bodies[_selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Search food.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
