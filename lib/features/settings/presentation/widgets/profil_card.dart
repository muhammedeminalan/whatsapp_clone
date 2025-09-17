// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/context_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';

class ProfilCard extends StatelessWidget {
  final String profilPhoto;
  final String userName;
  final String? biography;
  void Function()? onTap;
  ProfilCard({
    super.key,
    required this.profilPhoto,
    required this.userName,
    this.biography,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(profilPhoto),
        ),
        title: Text(userName, style: context.titleMedium),
        subtitle: Text(biography ?? "", style: context.titleSmall),
      ),
    ).paddingHorizontal(8);
  }
}
