import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  ///  Light theme for checkboxes
  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? AppColors.white
          : Colors.transparent;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? AppColors.black
          : Colors.transparent;
    }),
    side: MaterialStateBorderSide.resolveWith((states) {
      return BorderSide(
        color: states.contains(MaterialState.selected)
            ? AppColors.grey
            : AppColors.black,
        width: 2,
      );
    }),
  );

  /// Dark theme for checkboxes
  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? AppColors.white
          : Colors.transparent;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
     return states.contains(MaterialState.selected)
        ? AppColors.grey
        : Colors.transparent;
    }),
    side: MaterialStateBorderSide.resolveWith((states) {
      return BorderSide(
        color: states.contains(MaterialState.selected)
            ? AppColors.grey
            : AppColors.white,
        width: 2,
      );
    }),
  );
}
