import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// Manages app-wide settings such as theme mode and locale.
class AppSettingsState {
  final ThemeMode themeMode;
  final Locale locale;
  const AppSettingsState({this.themeMode = ThemeMode.system, this.locale = const Locale('en')});

  AppSettingsState copyWith({ThemeMode? themeMode, Locale? locale}) =>
      AppSettingsState(themeMode: themeMode ?? this.themeMode, locale: locale ?? this.locale);
}

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState());

  /// Toggles between light and dark explicitly. If currently dark, switch to light, else dark.
  void toggleTheme() {
    emit(state.copyWith(themeMode: state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark));
  }

  /// Toggles between Arabic and English.
  void toggleLanguage() {
    emit(state.copyWith(locale: state.locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar')));
  }
}

