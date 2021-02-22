import 'package:AppReceitas/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categories_route.dart';
import 'favorites_route.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsRoute extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsRoute(this.favoriteMeals);

  @override
  _TabsRouteState createState() => _TabsRouteState();
}

class _TabsRouteState extends State<TabsRoute> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Food Categories',
        'screen': CategoriesRoute(),
      },
      {
        'title': 'Favorites',
        'screen': FavoritesRoute(widget.favoriteMeals),
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
          style: TextStyle(color: Theme.of(context).appBarTheme.textTheme.bodyText1.color),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Get.isDarkMode
                  ? Icon(Icons.wb_sunny)
                  : Icon(Icons.nightlight_round),
              color: Theme.of(context).appBarTheme.iconTheme.color,
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme,
                );
              })
        ],
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
