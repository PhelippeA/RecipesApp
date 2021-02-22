import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/main_drawer.dart';
import '../models/preferences.dart';

class PreferencesRoute extends StatefulWidget {
  final Preferences preferences;
  final Function(Preferences) onChangedPreferences;
  const PreferencesRoute(this.preferences, this.onChangedPreferences);

  @override
  _PreferencesRouteState createState() => _PreferencesRouteState();
}

class _PreferencesRouteState extends State<PreferencesRoute> {
  Preferences preferences;
  SharedPreferences prefs;

  initState() {
    super.initState();
    preferences = widget.preferences;
    prefs = getPreferences();
  }

  getPreferences() async => await SharedPreferences.getInstance();

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onChangedPreferences(preferences);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferences',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                _createSwitch(
                  'Gluten-Free',
                  'Shows only gluten-free meals',
                  preferences.isGlutenFree,
                  (value) => setState(() {
                    prefs.setBool("isGlutenFree", value);
                    preferences.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Lactose-Free',
                  'Shows only lactose-free meals',
                  preferences.isLactoseFree,
                  (value) => setState(() {
                    prefs.setBool("isLactoseFree", value);
                    preferences.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'Vegan',
                  'Shows only vegan meals',
                  preferences.isVegan,
                  (value) => setState(() {
                    prefs.setBool("isVegan", value);
                    preferences.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Shows only vegetarian meals',
                  preferences.isVegetarian,
                  (value) => setState(() {
                    prefs.setBool("isVegetarian", value);
                    preferences.isVegetarian = value;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
