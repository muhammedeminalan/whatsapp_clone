import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;

  const CostumTextField({
    super.key,
    this.hintText,
    this.controller,
    this.autofocus = false,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium,
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText ?? 'Ara',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
