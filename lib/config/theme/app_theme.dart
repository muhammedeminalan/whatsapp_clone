
import 'package:flutter/material.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

class AppTheme {
  final LightTheme _lightTheme = LightTheme();
  final DarkTheme _darkTheme = DarkTheme();

  ThemeData get light => _lightTheme.theme;
  ThemeData get dark => _darkTheme.theme;
}
