import 'package:flutter/material.dart';
import '../constants/app_colors.dart'; // import your color file

class AppTextTheme {
  AppTextTheme._();

  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.text,
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.text,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.subtext,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.text,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.subtext,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.subtext,
    ),
  );
}
