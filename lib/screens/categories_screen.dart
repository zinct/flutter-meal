import 'package:flutter/material.dart';
import 'package:meal_menu/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> _categories = const [
    Category(id: '1', title: 'Breads', color: Colors.blue),
    Category(id: '2', title: 'Cereals', color: Colors.lightGreen),
    Category(id: '3', title: 'Rice', color: Colors.pink),
    Category(id: '4', title: 'Pasta', color: Colors.pink),
    Category(id: '5', title: 'Noodles', color: Colors.lime),
    Category(id: '6', title: 'Vegetables', color: Colors.indigo),
    Category(id: '7', title: 'Fruit', color: Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[50],
      child: GridView.count(
        padding: EdgeInsets.all(5),
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4 / 3,
        children: _categories
            .map(
              (row) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      row.color.withOpacity(.7),
                      row.color.withOpacity(1),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    row.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
