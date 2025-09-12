// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/navigator_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';

class SettinngsCard extends StatelessWidget {
  final String settingsName;
  final Widget page;

  const SettinngsCard({
    super.key,
    required this.settingsName,
    this.page = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.pushPage(page);
        },
        leading: Icon(Icons.settings),
        title: Text(settingsName, style: context.titleMedium),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    ).paddingHorizontal(8);
  }
}
