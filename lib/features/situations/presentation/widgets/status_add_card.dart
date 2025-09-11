import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';

class StatusAddCard extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final VoidCallback? onAddPressed;
  final VoidCallback? onIcon1Pressed;
  final VoidCallback? onIcon2Pressed;

  const StatusAddCard({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    this.onAddPressed,
    this.onIcon1Pressed,
    this.onIcon2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profil Foto + Add Button
        Stack(
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

        10.width,

        // Kullanıcı adı
        Expanded(child: Text(userName, style: context.headlineSmall)),

        // Sağdaki 2 icon button
        CostumIconButton(icon: Icons.camera_alt, onTap: onIcon1Pressed),
        10.width,
        CostumIconButton(icon: Icons.edit, onTap: onIcon2Pressed),
        10.width,
      ],
    );
  }
}
