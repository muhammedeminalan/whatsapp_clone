import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/context_extensions.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';

class StatusAddListTile extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final VoidCallback? onAddPressed;
  final VoidCallback? cameraPressed;
  final VoidCallback? textPressed;

  const StatusAddListTile({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    this.onAddPressed,
    this.cameraPressed,
    this.textPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: GestureDetector(
                onTap: onAddPressed,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: context.primaryColor,
                  child: const Icon(Icons.add, size: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        title: Text(userName, style: context.headlineSmall),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CostumIconButton(icon: Icons.camera_alt, onTap: cameraPressed),
            const SizedBox(width: 10),
            CostumIconButton(icon: Icons.edit, onTap: textPressed),
          ],
        ),
      ),
    );
  }
}
