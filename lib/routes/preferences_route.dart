import 'package:flutter/material.dart';
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

  initState() {
    super.initState();
    preferences = widget.preferences;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
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
        title: Text('Preferences'),
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
                  (value) => setState(() => preferences.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose-Free',
                  'Shows only lactose-free meals',
                  preferences.isLactoseFree,
                  (value) => setState(() => preferences.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Shows only vegan meals',
                  preferences.isVegan,
                  (value) => setState(() => preferences.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Shows only vegetarian meals',
                  preferences.isVegetarian,
                  (value) => setState(() => preferences.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
