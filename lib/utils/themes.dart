import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return new ThemeData(
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.amber,
      fontFamily: 'Raleway',
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            ),
          ),
    );
  }

  static ThemeData get darkTheme {
    return new ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[900],
      accentColor: Colors.amber[200],
      appBarTheme: AppBarTheme(
        color: Colors.black,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.amber[200])),
        iconTheme: IconThemeData(color: Colors.amber[200]),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      fontFamily: 'Raleway',
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
}
