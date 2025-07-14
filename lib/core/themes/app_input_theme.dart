import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppInputTheme {
  AppInputTheme._();

  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    hintStyle: const TextStyle(color: AppColors.subtext),
    labelStyle: const TextStyle(color: AppColors.primary),
  );

  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.backgroundDark,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primaryDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
    ),
    hintStyle: TextStyle(color: AppColors.subtext.withOpacity(0.6)),
    labelStyle: const TextStyle(color: AppColors.primaryDark),
  );
}
