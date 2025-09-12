// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';

class DismisibleCardController {
  final ValueNotifier<double> offset = ValueNotifier(0);
  final ValueNotifier<bool> isPinned = ValueNotifier(false);
  final VoidCallback? onPinned;

  DismisibleCardController({this.onPinned});

  void togglePin() {
    isPinned.value = !isPinned.value;
    if (isPinned.value) {
      onPinned?.call(); // pinlendiğinde callback
    }
  }

  void updateOffset(double delta) =>
      offset.value = (offset.value + delta).clamp(-120, 0);

  void settleOffset() {
    offset.value = offset.value < -60 ? -120 : 0;
  }
}

class DismisibleCard extends StatelessWidget {
  final String profil;
  final String userName;
  final String message;
  final String time;
  final int unreadCount;
  final DismisibleCardController controller;
  final VoidCallback? onMoreTap;
  final VoidCallback? onTap;

  const DismisibleCard({
    super.key,
    required this.profil,
    required this.userName,
    required this.message,
    required this.time,
    this.unreadCount = 0,
    required this.controller,
    this.onMoreTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          // Arka plan aksiyonları (Pin + More)
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: controller.togglePin,
                  child: Container(
                    width: 60,
                    color: context.primaryColor,
                    alignment: Alignment.center,
                    child: const Icon(Icons.push_pin, size: 28),
                  ),
                ),
                InkWell(
                  onTap: onMoreTap,
                  child: Container(
                    width: 60,
                    color: context.secondaryColor,
                    alignment: Alignment.center,
                    child: const Icon(Icons.more_horiz, size: 28),
                  ),
                ),
              ],
            ),
          ),
          // Ön plan kartı
          ValueListenableBuilder<double>(
            valueListenable: controller.offset,
            builder: (context, offset, child) {
              return Transform.translate(
                offset: Offset(offset, 0),
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) =>
                      controller.updateOffset(details.delta.dx),
                  onHorizontalDragEnd: (details) => controller.settleOffset(),
                  child: AbsorbPointer(
                    absorbing: offset != 0,
                    child: _buildCardContent(context, theme),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profil fotoğrafı
          CircleAvatar(radius: 32, backgroundImage: NetworkImage(profil)),
          const SizedBox(width: 16),
          // Kullanıcı adı ve mesaj
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Sağ taraf: saat, pin durumu, badge
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Pin ikonu: sadece isPinned true olduğunda görünsün
                  ValueListenableBuilder<bool>(
                    valueListenable: controller.isPinned,
                    builder: (context, isPinned, child) {
                      if (!isPinned) return const SizedBox.shrink();
                      return Icon(
                        Icons.push_pin,
                        size: 24,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      );
                    },
                  ),
                  if (unreadCount > 0) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        unreadCount.toString(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
