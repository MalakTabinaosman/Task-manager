/// text.dart
///
/// Defines the text theme for the app, tuned for calm purple aesthetics.
import 'package:flutter/material.dart';
import '../constants/colors.dart';

TextTheme buildTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, color: AppColors.neutral100),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.neutral100),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.neutral100),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral100),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.neutral100),
  );
}

