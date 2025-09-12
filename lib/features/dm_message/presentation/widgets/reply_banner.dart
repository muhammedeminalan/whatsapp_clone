import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/features/dm_message/data/model/message_model.dart';

class ReplyBanner extends StatelessWidget {
  final MessageModel message;
  final VoidCallback onCancel;

  const ReplyBanner({super.key, required this.message, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.primary400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.isMe ? "Senin mesajın" : "Onun mesajı",
                  style: context.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                2.height,
                Text(
                  message.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium?.copyWith(color: Colors.black87),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: onCancel,
          ),
        ],
      ),
    );
  }
}
