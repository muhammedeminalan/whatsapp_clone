import 'package:flutter/material.dart';
import '../../utils/extensions/context_extensions.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? titleWidget;
  final String? profileImageUrl;
  final String? profileName;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final Color? backgroundColor;
  final bool centerTitle;

  const ProfileAppBar({
    super.key,
    this.titleText,
    this.titleWidget,
    this.profileImageUrl,
    this.profileName,
    this.actions,
    this.leading,
    this.elevation = 4.0,
    this.backgroundColor,
    this.centerTitle = false,
  }) : assert(
         (titleText != null || titleWidget != null) ||
             (profileName != null && profileImageUrl != null),
         'titleText/titleWidget veya profileName + profileImageUrl verilmelidir',
       );

  @override
  Widget build(BuildContext context) {
    Widget? titleContent;

    if (titleWidget != null) {
      titleContent = titleWidget;
    } else if (profileName != null && profileImageUrl != null) {
      titleContent = Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(profileImageUrl!),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 10),
          Text(profileName!, style: context.titleLarge),
        ],
      );
    } else {
      titleContent = Text(titleText!, style: context.titleLarge);
    }

    return AppBar(
      title: titleContent,

      actions: actions,
      leading: leading,
      elevation: elevation,
      backgroundColor:
          backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
