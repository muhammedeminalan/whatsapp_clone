import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/core/widgets/bottom_sheet/fancy_bottom_sheet.dart';
import 'package:whatsapp_clone/core/widgets/card/costum_list_title.dart';
import '../../data/model/message_model.dart';
import '../../../../core/utils/extensions/index.dart';

class SwipeableMessageBubble extends StatefulWidget {
  final MessageModel message;
  final void Function(MessageModel) onSwipe;
  final String Function(DateTime) formatTime;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const SwipeableMessageBubble({
    super.key,
    required this.message,
    required this.onSwipe,
    required this.formatTime,
    this.onDelete,
    this.onEdit,
  });

  @override
  State<SwipeableMessageBubble> createState() => _SwipeableMessageBubbleState();
}

class _SwipeableMessageBubbleState extends State<SwipeableMessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.3, 0), // sağa %30 kayma
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _handleSwipe() async {
    await _controller.forward();
    widget.onSwipe(widget.message);
    await _controller.reverse();
  }

  void _showOptionsSheet() {
    return FancyBottomSheet.show(
      context,
      title: "Mesaj Seçenekleri",
      initialChildSize: 0.40,
      isSavedButton: false,
      content: [
        CustomListTitle(
          title: "Yanıtla",
          leadingIcon: Icons.reply,
          onTap: () {
            Navigator.of(context).pop();
            widget.onSwipe(widget.message);
          },
        ),
        CustomListTitle(
          title: "Kopyala",
          leadingIcon: Icons.copy,
          onTap: () {
            Navigator.of(context).pop();
            Clipboard.setData(ClipboardData(text: widget.message.text));
          },
        ),
        CustomListTitle(
          title: "Düzenle",
          leadingIcon: Icons.edit_sharp,
          onTap: () {
            context.pop();
            widget.onEdit?.call();
          },
        ),
        CustomListTitle(
          leadingIcon: Icons.delete,
          leadingIconColor: context.errorColor,
          titleColor: context.errorColor,
          title: "Sil",
          onTap: () {
            context.pop();
            widget.onDelete?.call();
          },
        ),
      ].column(spacing: 0),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = const Radius.circular(15);
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          _handleSwipe();
        }
      },
      onLongPress: _showOptionsSheet,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Align(
          alignment: widget.message.isMe
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            constraints: BoxConstraints(maxWidth: context.scrennWidth(0.7)),
            decoration: BoxDecoration(
              color: widget.message.isMe
                  ? context.primary800
                  : context.onPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: radius,
                bottomLeft: widget.message.isMe ? radius : Radius.zero,
                bottomRight: widget.message.isMe ? Radius.zero : radius,
              ),
            ),
            child: Column(
              crossAxisAlignment: widget.message.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.text,
                  style: TextStyle(
                    color: widget.message.isMe ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.height,
                Text(
                  widget.formatTime(widget.message.timestamp),
                  style: TextStyle(
                    color: widget.message.isMe
                        ? Colors.white70
                        : Colors.black54,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
