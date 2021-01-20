import 'package:flutter/material.dart';
import 'categories_route.dart';
import 'favorites_route.dart';
import '../components/main_drawer.dart';

class TabsRoute extends StatefulWidget {
  @override
  _TabsRouteState createState() => _TabsRouteState();
}

class _TabsRouteState extends State<TabsRoute> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Categories List', 'screen': CategoriesRoute()},
    {'title': 'Favorites', 'screen': FavoritesRoute()}
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        centerTitle: true,
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
