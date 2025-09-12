import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';

class StatusListTile extends StatelessWidget {
  final String userName;
  final String url;
  final void Function()? onTap;

  const StatusListTile({
    super.key,
    required this.userName,
    required this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),

      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: context.secondaryColor, width: 3),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        title: Text(
          userName,
          style: context.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    ).paddingHorizontal(8);
  }
}
