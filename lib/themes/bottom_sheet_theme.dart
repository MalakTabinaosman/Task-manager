import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  /// Light theme for bottom sheet
  static final BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.white,
    modalBackgroundColor: AppColors.white,
    showDragHandle: true,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  /// Dark theme for bottom sheet
  static final BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.backgroundDark,
    modalBackgroundColor: AppColors.backgroundDark,
    showDragHandle: true,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
