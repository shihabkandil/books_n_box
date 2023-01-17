import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '/../../utils/enums/current_theme_enum.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(defaultTheme) : super(ThemeState(appTheme: defaultTheme));
  void switchTheme(value) {
    // print(value);
    if (value == true) {
      //appTheme = AppColors.darkTheme;
      emit(ThemeState(appTheme: AppColors.darkTheme));
    } else if (value == false) {
      //appTheme = AppColors.lightTheme;
      emit(ThemeState(appTheme: AppColors.lightTheme));
    }
  }
}



