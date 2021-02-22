import 'package:AppReceitas/utils/app_routes.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({this.meal});

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.details_meal,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text(
                          '${meal.duration} min',
                          style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.bodyText1.color,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(
                          '${meal.complexityText}',
                          style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.bodyText1.color,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(
                          '${meal.costText}',
                          style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.bodyText1.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
