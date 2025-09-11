import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../text_styles/app_text_styles.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      // onBackground: AppColors.lightTextPrimary,
      onSurface: AppColors.lightTextPrimary,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.lightBodyLarge,
      bodyMedium: AppTextStyles.lightBodyMedium,
      bodySmall: AppTextStyles.lightBodySmall,
      titleLarge: AppTextStyles.lightTitleLarge,
      titleMedium: AppTextStyles.lightTitleMedium,
      titleSmall: AppTextStyles.lightTitleSmall,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.white,
    ),
  );
}
