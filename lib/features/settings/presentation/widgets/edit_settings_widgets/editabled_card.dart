import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

class EditableCard extends StatelessWidget {
  final String title; // Üstteki yazı
  final String subtitle; // Alt metin
  final IconData? trailingIcon; // Sağdaki ikon
  final VoidCallback? onTap; // Tıklama fonksiyonu
  final Color? borderColor; // Card border rengi
  final double borderWidth; // Border kalınlığı
  final double borderRadius; // Card radius
  final EdgeInsetsGeometry padding; // Genel padding
  final TextStyle? titleStyle; // Başlık stili
  final TextStyle? subtitleStyle; // Alt metin stili

  const EditableCard({
    super.key,
    required this.title,
    this.subtitle = "",
    this.trailingIcon = Icons.arrow_forward_ios,
    this.onTap,
    this.borderColor,
    this.borderWidth = 1,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              titleStyle ??
              context.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ).paddingHorizontal(padding.horizontal / 2), // padding uyumu
        const SizedBox(height: 4),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              width: borderWidth,
              color: borderColor ?? Colors.grey.shade300,
            ),
          ),
          child: ListTile(
            title: Text(
              subtitle,
              style: subtitleStyle ?? context.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: trailingIcon != null ? Icon(trailingIcon) : null,
            onTap: onTap,
          ),
        ),
      ],
    ).paddingHorizontal(padding.horizontal / 2);
  }
}
