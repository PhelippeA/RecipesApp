import 'package:AppReceitas/components/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoritesRoute extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  const FavoritesRoute(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty)
      return Center(
        child: Text(
          'There isn\'t any favorite meals yet',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryTextTheme.bodyText1.color,
          ),
        ),
      );
    else
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (_, index) => MealItem(meal: _favoriteMeals[index]),
      );
  }
}
