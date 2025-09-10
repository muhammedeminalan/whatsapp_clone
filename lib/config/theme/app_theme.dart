import 'package:flutter/material.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

class AppTheme {
  // Private constructor
  AppTheme._();

  // Static instance
  static final LightTheme _lightTheme = LightTheme();
  static final DarkTheme _darkTheme = DarkTheme();

  // Static erişim
  static ThemeData get light => _lightTheme.theme;
  static ThemeData get dark => _darkTheme.theme;
}
