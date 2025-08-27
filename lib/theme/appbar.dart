/// appbar.dart
///
/// AppBar theming for consistent top bar styles.
import 'package:flutter/material.dart';
import '../constants/colors.dart';

AppBarTheme buildAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: AppColors.purple50,
    foregroundColor: AppColors.neutral100,
    elevation: 0,
    centerTitle: true,
  );
}

