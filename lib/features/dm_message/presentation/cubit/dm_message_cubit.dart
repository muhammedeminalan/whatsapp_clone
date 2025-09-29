import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/dm_message/data/model/message_model.dart';

class DmMessageState {
  final List<MessageModel> messages;
  final MessageModel? replyingMessage;
  final MessageModel? editingMessage;

  const DmMessageState({
    this.messages = const [],
    this.replyingMessage,
    this.editingMessage,
  });

  DmMessageState copyWith({
    List<MessageModel>? messages,
    MessageModel? replyingMessage,
    MessageModel? editingMessage,
  }) {
    return DmMessageState(
      messages: messages ?? this.messages,
      replyingMessage: replyingMessage,
      editingMessage: editingMessage,
    );
  }
}

/// ----- Cubit -----
class DmMessageCubit extends Cubit<DmMessageState> {
  DmMessageCubit() : super(DmMessageState(messages: _dummyMessages));

  static final _dummyMessages = [
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

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    if (state.editingMessage != null) {
      // Düzenleme modu
      final index = state.messages.indexOf(state.editingMessage!);
      if (index != -1) {
        final updated = List<MessageModel>.from(state.messages);
        updated[index] = MessageModel(
          text: text,
          isMe: state.editingMessage!.isMe,
          timestamp: DateTime.now(),
        );
        emit(state.copyWith(messages: updated, editingMessage: null));
      }
    } else {
      // Normal gönderme
      final newText = state.replyingMessage != null
          ? "↪ ${state.replyingMessage!.text}\n$text"
          : text;

      final updated = List<MessageModel>.from(state.messages)
        ..add(
          MessageModel(text: newText, isMe: true, timestamp: DateTime.now()),
        );

      emit(state.copyWith(messages: updated, replyingMessage: null));
    }
  }

  void startReply(MessageModel message) {
    emit(state.copyWith(replyingMessage: message));
  }

  void cancelReply() {
    emit(state.copyWith(replyingMessage: null));
  }

  void startEdit(MessageModel message) {
    emit(state.copyWith(editingMessage: message));
  }

  void cancelEdit() {
    emit(state.copyWith(editingMessage: null));
  }

  void deleteMessage(MessageModel message) {
    final updated = List<MessageModel>.from(state.messages)..remove(message);

    emit(
      state.copyWith(
        messages: updated,
        replyingMessage: state.replyingMessage == message
            ? null
            : state.replyingMessage,
        editingMessage: state.editingMessage == message
            ? null
            : state.editingMessage,
      ),
    );
  }
}
