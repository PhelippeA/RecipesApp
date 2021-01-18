import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoriesMealsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) => MealItem(meal: categoryMeals[index]),
      ),
    );
  }
}
