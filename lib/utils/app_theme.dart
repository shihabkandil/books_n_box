import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class AppThemeData {
  static ThemeData get materialTheme {
    return ThemeData(
      fontFamily: 'Default-Font',
      primaryColor: AppColors.primaryColor,
      //canvasColor: Colors.white,
      //primaryColorDark: Constants.GREY_COLOR,
      // Theme.of(context).primaryColor this is the usage
    );
  }
}
