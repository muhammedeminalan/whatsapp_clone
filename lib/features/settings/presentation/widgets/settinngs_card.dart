// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

class SettinngsCard extends StatelessWidget {
  final String settingsName;
  final void Function()? onTap;

  const SettinngsCard({super.key, required this.settingsName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.settings),
        title: Text(settingsName, style: context.titleMedium),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    ).paddingHorizontal(8);
  }
}
