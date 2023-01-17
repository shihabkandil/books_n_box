import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../utils/app_theme.dart';
import '/../../utils/enums/current_theme_enum.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(defaultTheme) : super(ThemeState(appTheme: defaultTheme));

  void switchTheme(value) {
    if (value == true) {
      emit(ThemeState(appTheme: AppTheme.darkTheme));
    } else if (value == false) {
      emit(ThemeState(appTheme: AppTheme.lightTheme));
    }
  }
}
