import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class AppThemeData {
  static ThemeData get materialTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.darkBlue,
      //canvasColor: Colors.white,
      //primaryColorDark: Constants.GREY_COLOR,
      // Theme.of(context).primaryColor this is the usage
    );
  }
}
