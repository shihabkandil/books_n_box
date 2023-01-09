import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff0646DC);
  static const Color favorite_color = Color.fromARGB(255, 232, 89, 79);
  static Color backgroundColor = Color(0xff01010e);
  static const Color tileColor = Color.fromARGB(255, 222, 222, 221);
  static var lightTheme = ThemeData(textTheme:TextTheme(bodyMedium: TextStyle(color: Colors.pink)),backgroundColor: Colors.white,primaryColor: Color(0xff0646DC));
  static var darkTheme = ThemeData(backgroundColor: Color.fromARGB(255, 0, 0, 0),primaryColor: Color(0xff0646DC));
}
