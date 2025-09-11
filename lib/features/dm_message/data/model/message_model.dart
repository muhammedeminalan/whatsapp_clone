class MessageModel {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });

  MessageModel copyWith({String? text, bool? isMe, DateTime? timestamp}) {
    return MessageModel(
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'isMe': isMe,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      text: map['text'] as String,
      isMe: map['isMe'] as bool,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }
}
