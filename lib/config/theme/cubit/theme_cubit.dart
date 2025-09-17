import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../init/injection_container.dart';
import '../../../core/service/cache/shared_prefs_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _prefKey = "isDark";

  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final prefs = sl<SharedPrefsService>();
    final isDark = prefs.getBool(_prefKey, defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    final prefs = sl<SharedPrefsService>();
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(newTheme);
    prefs.setBool(_prefKey, newTheme == ThemeMode.dark);
  }
}
