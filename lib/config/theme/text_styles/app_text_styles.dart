
import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppTextStyles {
  static const _bodyLarge = TextStyle(fontSize: 16);
  static const _bodyMedium = TextStyle(fontSize: 14);
  static const _bodySmall = TextStyle(fontSize: 12);
  static const _titleLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const _titleMedium = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const _titleSmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static final lightBodyLarge = _bodyLarge.copyWith(color: AppColors.lightTextPrimary);
  static final lightBodyMedium = _bodyMedium.copyWith(color: AppColors.lightTextSecondary);
  static final lightBodySmall = _bodySmall.copyWith(color: AppColors.lightTextSecondary);
  static final lightTitleLarge = _titleLarge.copyWith(color: AppColors.lightTextPrimary);
  static final lightTitleMedium = _titleMedium.copyWith(color: AppColors.lightTextPrimary);
  static final lightTitleSmall = _titleSmall.copyWith(color: AppColors.lightTextSecondary);

  static final darkBodyLarge = _bodyLarge.copyWith(color: AppColors.darkTextPrimary);
  static final darkBodyMedium = _bodyMedium.copyWith(color: AppColors.darkTextSecondary);
  static final darkBodySmall = _bodySmall.copyWith(color: AppColors.darkTextSecondary);
  static final darkTitleLarge = _titleLarge.copyWith(color: AppColors.darkTextPrimary);
  static final darkTitleMedium = _titleMedium.copyWith(color: AppColors.darkTextPrimary);
  static final darkTitleSmall = _titleSmall.copyWith(color: AppColors.darkTextSecondary);
}
