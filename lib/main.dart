import 'package:flutter/material.dart';
import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'routes/tabs_route.dart';
import 'routes/categories_meals_route.dart';
import 'routes/details_meal_route.dart';
import 'routes/preferences_route.dart';
import 'utils/app_routes.dart';
import 'models/preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _preferences = Preferences();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _filterMeals(Preferences preferences) {
    setState(() {
      this._preferences = preferences;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = preferences.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = preferences.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = preferences.isVegan && !meal.isVegan;
        final filterVegetarian = preferences.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeal.contains(meal)
          ? _favoriteMeal.remove(meal)
          : _favoriteMeal.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeal.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (_) => TabsRoute(_favoriteMeal),
        AppRoutes.categories_meals: (_) =>
            CategoriesMealsRoute(_availableMeals),
        AppRoutes.details_meal: (_) =>
            DetailsMealRoute(_toggleFavorite, _isFavorite),
        AppRoutes.preferences: (_) =>
            PreferencesRoute(_preferences, _filterMeals)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
