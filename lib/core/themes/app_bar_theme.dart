import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  /// Light AppBar theme
  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: AppColors.text,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.text,
      size: 24,
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.text,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  /// Dark AppBar theme
  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: AppColors.white,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.white,
      size: 24,
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}
