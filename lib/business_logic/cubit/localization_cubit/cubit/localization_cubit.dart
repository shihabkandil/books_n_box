import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/repository/user_data_cache.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(Locale defaultLanguage)
      : super(LocalizationState(
            locale: defaultLanguage, state: LanguageState.Initial));

  changeLanguage(String lang) {
    if (lang == 'عربي') {
      emit(LocalizationState(locale: Locale('ar'), state: LanguageState.ar));
      setPreference('ar');
    } else {
      emit(LocalizationState(locale: Locale('en'), state: LanguageState.en));
      setPreference('en');
    }
  }

  switchLanguage() {
    if (state.locale == Locale('ar')) {
      emit(LocalizationState(locale: Locale('en'), state: LanguageState.en));
      setPreference('en');
    } else {
      emit(LocalizationState(locale: Locale('ar'), state: LanguageState.ar));
      setPreference('ar');
    }
  }

  void getPreference() {
    String lang = UserDataCache().readLanguagePreference();
    emit(LocalizationState(locale: Locale(lang), state: LanguageState.Initial));
  }

  void setPreference(String lang) {
    UserDataCache().writeLanguagePreference(lang);
  }

  @override
  void onChange(Change<LocalizationState> change) {
    super.onChange(change);
    if (kDebugMode) {
      debugPrint(change.toString());
    }
  }
}
