import 'package:flutter/material.dart';
import '../models/meal.dart';

class DetailsMealRoute extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;
  const DetailsMealRoute(this.onToggleFavorite, this.isFavorite);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(
      BuildContext context, Widget widget, int itemCount) {
    print(itemCount);
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: double.tryParse("${itemCount * 40}"),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          meal.title,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index])),
                  color: Theme.of(context).accentColor,
                ),
              ),
              meal.ingredients.length,
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.steps[index])),
                  color: Theme.of(context).accentColor,
                ),
              ),
              meal.steps.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentIconTheme.color,
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border,
            color: Theme.of(context).iconTheme.color),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
