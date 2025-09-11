import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';

class StatusCard extends StatelessWidget {
  final String userName;
  final String url;
  final void Function()? onTap;
  const StatusCard({
    super.key,
    required this.userName,
    required this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: context.secondaryColor, width: 3),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(userName, style: context.headlineSmall),
        ],
      ),
    );
  }
}
