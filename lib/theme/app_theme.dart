/// app_theme.dart
///
/// Aggregates all theming elements into a single ThemeData for the app.
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'text.dart';
import 'buttons.dart';
import 'appbar.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.purple500,
      primary: AppColors.purple600,
      secondary: AppColors.purple400,
      background: AppColors.neutral10,
      surface: Colors.white,
      brightness: Brightness.light,
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: buildTextTheme(),
      elevatedButtonTheme: buildElevatedButtonTheme(),
      textButtonTheme: buildTextButtonTheme(),
      outlinedButtonTheme: buildOutlinedButtonTheme(),
      appBarTheme: buildAppBarTheme(),
    );
  }
}

