import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, BuildContext context, {Function onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Theme.of(context).iconTheme.color),
      title: (Text(
        label,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            color: Theme.of(context).textTheme.headline6.color,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 85,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              alignment: Alignment.center,
              child: Text(
                'Let\'s cook ?',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).textTheme.headline6.color),
              ),
            ),
            SizedBox(height: 30),
            _createItem(
              Icons.restaurant,
              'Meals',
              context,
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createItem(
              Icons.settings,
              'Settings',
              context,
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.preferences),
            ),
          ],
        ),
      ),
    );
  }
}
