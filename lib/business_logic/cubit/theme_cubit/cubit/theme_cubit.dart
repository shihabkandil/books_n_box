import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/main.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '/../../utils/enums/current_theme_enum.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(defaultTheme) : super(ThemeState(appTheme: defaultTheme));
 void switchTheme() {
    if (state.currentTheme == AppColors.lightTheme) {
      appTheme = AppColors.darkTheme;
      emit(ThemeState(appTheme:  AppColors.darkTheme));
    } else if (state.currentTheme == AppColors.darkTheme) {
      appTheme = AppColors.lightTheme;
      emit(ThemeState(appTheme: AppColors.lightTheme));
    } 
  }
}

//switch theme?
// bool _isDark = false;
// bool get isDark => _isDark;


// void toggleTheme(bool newValue) {
// _isDark = newValue;
// if (_theme == ThemeMode.lightTheme) {
//   _theme = ThemeMode.darkTheme;
// } else {
//   _theme = ThemeMode.lightTheme;
// }
// notifyListeners();
// }


// Switch(
//        value: Provider.of<ThemeProvider>(context).isDark,
//        onChanged:(value) => Provider.of<ThemeProvider>(context,listen: false).toggleTheme(value),
//       ),


