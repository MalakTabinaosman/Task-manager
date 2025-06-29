import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppIconTheme {
  AppIconTheme._();

  static final IconThemeData lightIconTheme = const IconThemeData(
    color: AppColors.primary,
    size: 24,
  );

  static final IconThemeData darkIconTheme = const IconThemeData(
    color: AppColors.white,
    size: 24,
  );
}
