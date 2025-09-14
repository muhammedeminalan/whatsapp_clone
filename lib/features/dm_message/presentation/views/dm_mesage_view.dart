import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/widgets/appBar/profile_app_bar.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/features/dm_message/data/model/message_model.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/widgets/message_bubble.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/widgets/reply_banner.dart';
import '../widgets/message_input_field.dart';

@RoutePage()
class DmMessageView extends StatefulWidget {
  const DmMessageView({super.key});

  @override
  State<DmMessageView> createState() => _DmMessageViewState();
}

class _DmMessageViewState extends State<DmMessageView> {
  final TextEditingController _controller = TextEditingController();
  MessageModel? _replyingMessage;

  final List<MessageModel> _messages = [
    MessageModel(
      text: "Selam! Nasılsın?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    MessageModel(
      text: "İyiyim, sen nasılsın?",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
    ),
    MessageModel(
      text: "Ben de iyiyim. Bugün ne yaptın?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "Flutter ile yeni bir sohbet ekranı tasarladım!",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    MessageModel(
      text: "Harika, göster bakalım!",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
  ];

  // Mesaj gönderme
  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final newText = _replyingMessage != null
        ? "↪ ${_replyingMessage!.text}\n$text"
        : text;

    setState(() {
      _messages.add(
        MessageModel(text: newText, isMe: true, timestamp: DateTime.now()),
      );
      _controller.clear();
      _replyingMessage = null;
    });
  }

  // Swipe ile yanıt başlatma
  void _startReply(MessageModel message) {
    setState(() => _replyingMessage = message);
  }

  // Saat formatı
  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  ProfileAppBar _buildAppBar() {
    return ProfileAppBar(
      profileImageUrl: 'https://i.pravatar.cc/150?img=1}',
      profileName: 'Emin Alan',
      actions: [_videoCallButton(), 14.width, _callButton(), 14.width],
    );
  }

  CostumIconButton _callButton() {
    return CostumIconButton(
      icon: Icons.call,
      onTap: () {
        debugPrint('Call button clicked');
      },
    );
  }

  CostumIconButton _videoCallButton() {
    return CostumIconButton(
      icon: Icons.video_call,
      onTap: () {
        debugPrint('Video call button clicked');
      },
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: _listViewBuilder()),
          if (_replyingMessage != null) _replyBanner(),
          context.divider(color: Theme.of(context).dividerColor),
          _inputField(),
        ],
      ),
    );
  }

  MessageInputField _inputField() =>
      MessageInputField(controller: _controller, onSend: _sendMessage);

  ReplyBanner _replyBanner() {
    return ReplyBanner(
      message: _replyingMessage!,
      onCancel: () => setState(() => _replyingMessage = null),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(10),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[_messages.length - 1 - index];
        return _swipeableMessageBubble(msg);
      },
    );
  }

  SwipeableMessageBubble _swipeableMessageBubble(MessageModel msg) {
    return SwipeableMessageBubble(
      key: ValueKey(msg.text + msg.timestamp.toIso8601String()),
      message: msg,
      onSwipe: _startReply,
      formatTime: _formatTime,
    );
  }
}
