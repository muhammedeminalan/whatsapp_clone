import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';

class CoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText; // Basit başlık metni
  final Widget? titleWidget; // Alternatif olarak custom title widget
  final List<Widget>? actions; // Sağdaki butonlar
  final Widget? leading; // Sol ikon (geri butonu vs)
  final double elevation; // Gölge derinliği
  final Color? backgroundColor; // AppBar arkaplan rengi
  final bool centerTitle; // Başlığı ortala

  const CoreAppBar({
    super.key,
    this.titleText,
    this.titleWidget,
    this.actions,
    this.leading,
    this.elevation = 4.0,
    this.backgroundColor,
    this.centerTitle = true,
  }) : assert(
         titleText != null || titleWidget != null,
         'titleText veya titleWidget mutlaka verilmelidir',
       );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(titleText!, style: context.titleLarge),
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
