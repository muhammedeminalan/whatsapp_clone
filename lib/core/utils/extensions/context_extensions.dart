import 'package:flutter/material.dart';
import '../../../config/theme/colors/primary_colors.dart';
import '../../../config/theme/colors/secondary_colors.dart';

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

  ///theme data
  ThemeData get theme => Theme.of(this);

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

  // Primary shades
  Color get primary50 => PrimaryColors.primary50;
  Color get primary200 => PrimaryColors.primary200;
  Color get primary100 => PrimaryColors.primary100;
  Color get primary300 => PrimaryColors.primary300;
  Color get primary400 => PrimaryColors.primary400;
  Color get primary500 => PrimaryColors.primary500;
  Color get primary600 => PrimaryColors.primary600;
  Color get primary700 => PrimaryColors.primary700;
  Color get primary800 => PrimaryColors.primary800;
  Color get primary900 => PrimaryColors.primary900;

  // Secondary shades
  Color get secondary50 => SecondaryColors.secondary50;
  Color get secondary100 => SecondaryColors.secondary100;
  Color get secondary200 => SecondaryColors.secondary200;
  Color get secondary300 => SecondaryColors.secondary300;
  Color get secondary400 => SecondaryColors.secondary400;
  Color get secondary500 => SecondaryColors.secondary500;
  Color get secondary600 => SecondaryColors.secondary600;
  Color get secondary700 => SecondaryColors.secondary700;
  Color get secondary800 => SecondaryColors.secondary800;
  Color get secondary900 => SecondaryColors.secondary900;

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
