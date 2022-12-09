import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState(locale: Locale('en')));

  changeLanguage(String lang) {
    if (lang == 'Arabic') {
      emit(LocalizationState(locale: Locale('ar')));
    } else {
      emit(LocalizationState(locale: Locale('en')));
    }
  }
}
