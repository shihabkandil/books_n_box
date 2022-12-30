part of 'localization_cubit.dart';

class LocalizationState extends Equatable {
  LocalizationState({required this.locale});
  Locale locale;
  @override
  List<Object> get props => [locale];
}

// class LocalizationInitial extends LocalizationState {}
