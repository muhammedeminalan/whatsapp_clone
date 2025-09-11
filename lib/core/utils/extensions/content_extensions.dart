import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Ekran boyutları
  Size get screenSize => MediaQuery.of(this).size;

  /// Ekran yüksekliği
  double get height => screenSize.height;

  /// Ekran genişliği
  double get width => screenSize.width;

  /// Ekran yüksekliğinin oranı
  double screenHeight(double size) => screenSize.height * size;

  /// Ekran genişliğinin oranı
  double scrennWidth(double size) => screenSize.width * size;

  /// Boşluklar
  Divider divider({Color? color}) => Divider(color: color);

  /// Renkler
  Color get primaryColor =>
      Theme.of(this).colorScheme.primary; // Color(0xFF075E54);
  Color get secondaryColor =>
      Theme.of(this).colorScheme.secondary; // Color(0xFF25D366);
  Color get errorColor => Theme.of(this).colorScheme.error; // Colors.red;
  Color get backgroundColor =>
      Theme.of(this).colorScheme.surface; // Color(0xFFECE5DD);
  Color get onPrimaryColor =>
      Theme.of(this).colorScheme.onPrimary; // Colors.white;
  Color get onSecondaryColor =>
      Theme.of(this).colorScheme.onSecondary; // Colors.white;

  /// TextTheme kısaltmaları
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
