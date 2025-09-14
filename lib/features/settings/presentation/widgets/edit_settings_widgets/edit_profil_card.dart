// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/edit_settings_widgets/full_screen_profil_widget.dart';

class EditProfileCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Color? labelColor;
  void Function()? editTap;

  EditProfileCard({
    super.key,
    required this.imageUrl,
    this.label = "Düzenle",
    this.radius = 100,
    this.padding = const EdgeInsets.only(top: 24),
    this.labelColor,
    this.editTap,
  });

  void _openFullScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FullScreenProfilWidget(imageUrl: imageUrl),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _openFullScreen(context),
            child: Hero(
              tag: imageUrl,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          10.height,
          GestureDetector(
            onTap: editTap,
            child: Text(
              label,
              style: context.titleLarge!.copyWith(
                color: labelColor ?? context.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    ).paddingVertical(24);
  }
}
