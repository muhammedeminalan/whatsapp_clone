import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/navigator_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';

class ProfilCard extends StatelessWidget {
  final String profilPhoto;
  final String userName;
  final String? biography;
  final Widget page;
  const ProfilCard({
    super.key,
    required this.profilPhoto,
    required this.userName,
    this.biography,
    this.page = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.pushPage(page);
        },
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
