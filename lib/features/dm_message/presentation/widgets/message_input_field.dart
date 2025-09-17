import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/num_extensions.dart';
import '../../../../core/utils/extensions/index.dart';
import '../../../../core/widgets/index.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: CostumTextField(controller: controller)),
          4.width,
          CostumIconButton(icon: Icons.send, size: 20, onTap: onSend),
        ],
      ),
    );
  }
}
