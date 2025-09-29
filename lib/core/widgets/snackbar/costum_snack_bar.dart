import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double borderRadius = 12.0,
    IconData? icon,
    Color? iconColor,
    double iconSize = 24.0,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    Curve animationCurve = Curves.easeInOut,
    double elevation = 6.0,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, color: iconColor ?? textColor, size: iconSize),
          if (icon != null) const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: TextStyle(color: textColor)),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: behavior,
      elevation: elevation,
      margin: margin,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      animation: CurvedAnimation(
        parent: AnimationController(
          vsync: Scaffold.of(context),
          duration: Duration(milliseconds: 250),
        ),
        curve: animationCurve,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
