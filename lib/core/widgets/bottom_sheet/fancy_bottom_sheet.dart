import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/navigator_extensions.dart';

class FancyBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;
  final double initialChildSize;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? actionColor;
  final VoidCallback? onClose;
  final VoidCallback? onSave;
  final bool showSaveButton;

  const FancyBottomSheet({
    super.key,
    this.title,
    required this.content,
    this.initialChildSize = 0.8,
    this.backgroundColor,
    this.titleColor,
    this.actionColor,
    this.onClose,
    this.onSave,
    this.showSaveButton = true,
  });

  /// Widgeti göstermek için kolay static fonksiyon
  static void show(
    BuildContext context, {
    String? title,
    required Widget content,
    double initialChildSize = 0.8,
    Color? backgroundColor,
    Color? titleColor,
    Color? actionColor,
    VoidCallback? onClose,
    VoidCallback? onSave,
    bool showSaveButton = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FancyBottomSheet(
        title: title,
        content: content,
        initialChildSize: initialChildSize,
        backgroundColor: backgroundColor,
        titleColor: titleColor,
        actionColor: actionColor,
        onClose: onClose,
        onSave: onSave,
        showSaveButton: showSaveButton,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).canvasColor;
    final tColor = titleColor ?? Theme.of(context).textTheme.titleLarge?.color;
    final aColor = actionColor ?? Theme.of(context).colorScheme.secondary;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: onClose ?? () => Navigator.of(context).pop(),
                      ),
                      if (title != null)
                        Text(
                          title!,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: tColor),
                        ),
                      if (showSaveButton)
                        TextButton(
                          onPressed: () {
                            onSave;
                            context.pop();
                          },
                          child: Text(
                            "Kaydet",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(color: aColor),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(16), child: content),
              ],
            ),
          ),
        );
      },
    );
  }
}
