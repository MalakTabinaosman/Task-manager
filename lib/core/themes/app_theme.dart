import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/app_colors.dart';
import 'package:task_management_app/core/themes/app_bar_theme.dart';
import 'package:task_management_app/core/themes/app_icon_theme.dart';
import 'package:task_management_app/core/themes/app_input_theme.dart';
import 'package:task_management_app/core/themes/check_box_theme.dart';
import 'package:task_management_app/core/themes/elevated_button.dart';
import 'package:task_management_app/core/themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppInputTheme.lightInputDecorationTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
    iconTheme: AppIconTheme.lightIconTheme,


  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: AppInputTheme.darkInputDecorationTheme,
    checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
    iconTheme: AppIconTheme.darkIconTheme,
    
  );
}
