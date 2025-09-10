import 'package:flutter/material.dart';

class CostumIconButton extends StatelessWidget {
  CostumIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.bgColor = Colors.transparent,
    this.iconColor,
    this.size = 15,
  });
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: bgColor,
        maxRadius: size,
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
