import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/preferences.dart';

class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  Widget _createSwitch(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  var preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                _createSwitch(
                  'Sem glúten',
                  'Só exibe refeições sem glúten',
                  preferences.isGlutenFree,
                  (value) => setState(() => preferences.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Só exibe refeições sem lactose',
                  preferences.isLactoseFree,
                  (value) => setState(() => preferences.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  preferences.isVegan,
                  (value) => setState(() => preferences.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
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
