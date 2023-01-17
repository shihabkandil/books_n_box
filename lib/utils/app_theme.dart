import 'package:flutter/material.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyle(),
    ).apply(bodyColor: Colors.black),
    backgroundColor: Colors.white,
    primaryColor: Color(0xff0646DC),
  );
  static var darkTheme = ThemeData(
    textTheme: TextTheme(
      bodyMedium: TextStyle(),
    ).apply(bodyColor: Colors.white),
    backgroundColor: Colors.black,
    primaryColor: Color(0xff0646DC),
  );
}
