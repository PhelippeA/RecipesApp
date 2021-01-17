import 'package:AppReceitas/components/category_item.dart';
import 'package:AppReceitas/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('Let\'s cook ?'),
          alignment: Alignment.center,
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList(),
      ),
    );
  }
}
