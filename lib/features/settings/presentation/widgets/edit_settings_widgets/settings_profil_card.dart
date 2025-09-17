// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/context_extensions.dart';

class SettingsProfilCard extends StatelessWidget {
  final String settingsName;
  void Function()? onTap;
  IconData? trailingIcon;

  SettingsProfilCard({
    super.key,
    required this.settingsName,
    this.onTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.theme.dividerColor.withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12, // yayılma
            spreadRadius: 1, // kalınlık
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(settingsName, style: context.titleMedium),
        trailing: trailingIcon != null ? Icon(trailingIcon) : null,
      ),
    );
  }
}
