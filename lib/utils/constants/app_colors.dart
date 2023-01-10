import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff0646DC);
  static const Color favorite_color = Color.fromARGB(255, 232, 89, 79);
  static Color backgroundColor = Color(0xff01010e);
  static const Color tileColor = Color.fromARGB(255, 222, 222, 221);
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
