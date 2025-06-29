import 'package:flutter/material.dart';
import 'package:task_management_app/themes/app_bar_theme.dart';
import 'package:task_management_app/themes/app_icon_theme.dart';
import 'package:task_management_app/themes/app_input_theme.dart';
import 'package:task_management_app/themes/bottom_sheet_theme.dart';
import 'package:task_management_app/themes/check_box_theme.dart';
import 'package:task_management_app/themes/elevated_button.dart';
import 'package:task_management_app/themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppInputTheme.lightInputDecorationTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
    iconTheme: AppIconTheme.lightIconTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: AppInputTheme.darkInputDecorationTheme,
    checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
    iconTheme: AppIconTheme.darkIconTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    
  );
}
