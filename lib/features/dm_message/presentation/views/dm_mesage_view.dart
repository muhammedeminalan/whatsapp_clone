import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/cubit/dm_message_cubit.dart';
import '../widgets/message_bubble.dart';
import '../widgets/reply_banner.dart';
import '../widgets/message_input_field.dart';
import '../../../../core/utils/extensions/index.dart';
import '../../../../core/widgets/index.dart';

class DmMessageView extends StatelessWidget {
  const DmMessageView({super.key});

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocProvider(
      create: (_) => DmMessageCubit(),
      child: BlocBuilder<DmMessageCubit, DmMessageState>(
        builder: (context, state) {
          final cubit = context.read<DmMessageCubit>();

          // Eğer edit mode varsa textfield doldurulsun
          if (state.editingMessage != null &&
              controller.text != state.editingMessage!.text) {
            controller.text = state.editingMessage!.text;
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }

          return Scaffold(
            appBar: ProfileAppBar(
              profileImageUrl: 'https://i.pravatar.cc/150?img=1',
              profileName: 'Emin Alan',
              actions: [
                CostumIconButton(
                  icon: Icons.video_call,
                  onTap: () => debugPrint('Video call'),
                ),
                14.width,
                CostumIconButton(
                  icon: Icons.call,
                  onTap: () => debugPrint('Call'),
                ),
                14.width,
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final msg =
                            state.messages[state.messages.length - 1 - index];
                        return SwipeableMessageBubble(
                          key: ValueKey(
                            msg.text + msg.timestamp.toIso8601String(),
                          ),
                          message: msg,
                          onSwipe: cubit.startReply,
                          formatTime: _formatTime,
                          onDelete: () => cubit.deleteMessage(msg),
                          onEdit: () => cubit.startEdit(msg),
                        );
                      },
                    ),
                  ),
                  if (state.replyingMessage != null)
                    ReplyBanner(
                      message: state.replyingMessage!,
                      onCancel: cubit.cancelReply,
                    ),
                  context.divider(color: Theme.of(context).dividerColor),
                  MessageInputField(
                    controller: controller,
                    onSend: () {
                      cubit.sendMessage(controller.text);
                      controller.clear();
                    },
                  ).paddingAll(10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
