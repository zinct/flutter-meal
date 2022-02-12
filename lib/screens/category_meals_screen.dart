import 'package:flutter/material.dart';
import 'package:meal_menu/data/meals_data.dart';
import 'package:meal_menu/models/category.dart';
import 'package:meal_menu/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;
  final List<Meal> _meals;

  CategoryMealsScreen({required this.category})
      : _meals = meals.where((row) => row.categoryId == category.id).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView(
        children: _meals
            .map(
              (row) => Container(
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Image.network(
                              row.image,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: Container(
                                color: Colors.black26,
                                child: Text(
                                  row.name,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  print(row);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_alarm),
                                    Text(row.time),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.collections_bookmark),
                                    Text(row.difficultyText),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
