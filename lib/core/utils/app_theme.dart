import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  AppTheme._();
  /// dark theme
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
    ),
    drawerTheme: DrawerThemeData(),
    textTheme: TextTheme(
      headlineMedium: AppStyles.textStyle24BoldWhite.copyWith(
        color: AppColors.onPrimaryDark,
        fontWeight: .w500
      ),
      headlineLarge: AppStyles.textStyle20Bold.copyWith(
        color: AppColors.onPrimaryDark
      ),
      displayLarge: AppStyles.textStyle24BoldBlack
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColors.secondaryDark
      ),
      titleTextStyle: AppStyles.textStyle20Bold.copyWith(
        fontWeight: .w500,
        color: AppColors.secondaryDark,
      ),
    ),
  );
}
