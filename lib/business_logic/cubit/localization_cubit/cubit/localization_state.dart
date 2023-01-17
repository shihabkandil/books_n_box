part of 'localization_cubit.dart';

enum LanguageState { Initial, ar, en }

class LocalizationState extends Equatable {
  LocalizationState({required this.locale, required this.state});
  final Locale locale;
  final LanguageState state;
  @override
  List<Object> get props => [locale, state];
}
