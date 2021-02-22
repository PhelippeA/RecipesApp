import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return new ThemeData.light().copyWith(
      primaryColor: Colors.pink,
      scaffoldBackgroundColor: Colors.amber[100],
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            ),
          ),
      appBarTheme: AppBarTheme(
        color: Colors.pink,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      accentIconTheme: IconThemeData(color: Colors.white),
      primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
    );
  }

  static ThemeData get darkTheme {
    return new ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[900],
      accentColor: Colors.pink[300],
      appBarTheme: AppBarTheme(
        color: Colors.black,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.pink[300])),
        iconTheme: IconThemeData(color: Colors.pink[300]),
      ),
      primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      accentIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
            ),
          ),
    );
  }

  static Widget showingIconTheme(ThemeMode systemTheme) {
    return systemTheme == ThemeMode.light
        ? Icon(Icons.nightlight_round)
        : Icon(Icons.wb_sunny);
  }
}
