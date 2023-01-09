part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({this.currentTheme = CurrentTheme.defaultTheme,required this.appTheme});
  var appTheme;
  CurrentTheme currentTheme;
  @override
  List<Object> get props => [currentTheme];
}
