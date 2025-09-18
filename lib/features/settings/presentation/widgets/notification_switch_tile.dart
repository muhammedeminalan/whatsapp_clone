import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

class NotificationSwitchTile extends StatelessWidget {
  final String title;
  final String? description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return [
      [
        title
            .text(textStyle: context.titleMedium)
            .expanded(), // title sola hizalı
        Switch(value: value, onChanged: onChanged),
      ].row(crossAxisAlignment: CrossAxisAlignment.center),
      if (description != null) description!.text(textStyle: context.bodySmall),
    ].column(crossAxisAlignment: CrossAxisAlignment.start).paddingAll(8);
  }
}
