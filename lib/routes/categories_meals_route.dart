import 'package:AppReceitas/models/meal.dart';
import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';

class CategoriesMealsRoute extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsRoute(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

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
