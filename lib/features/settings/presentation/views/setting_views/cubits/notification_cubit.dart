import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';

import '../../../../../../core/service/cache/shared_prefs_service.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final prefs = sl<SharedPrefsService>();

  NotificationCubit()
    : super(
        NotificationState(
          chatNotifications: sl<SharedPrefsService>().getBool(
            'chatNotifications',
            defaultValue: true,
          ),
          callNotifications: sl<SharedPrefsService>().getBool(
            'callNotifications',
            defaultValue: true,
          ),
          appNotifications: sl<SharedPrefsService>().getBool(
            'appNotifications',
            defaultValue: true,
          ),
          adNotifications: sl<SharedPrefsService>().getBool(
            'adNotifications',
            defaultValue: true,
          ),
        ),
      );

  void toggleChat(bool value) {
    emit(state.copyWith(chatNotifications: value));
    prefs.setBool('chatNotifications', value);
  }

  void toggleCall(bool value) {
    emit(state.copyWith(callNotifications: value));
    prefs.setBool('callNotifications', value);
  }

  void toggleApp(bool value) {
    emit(state.copyWith(appNotifications: value));
    prefs.setBool('appNotifications', value);
  }

  void toggleAd(bool value) {
    emit(state.copyWith(adNotifications: value));
    prefs.setBool('adNotifications', value);
  }
}

// Cubit State
class NotificationState {
  final bool chatNotifications;
  final bool callNotifications;
  final bool appNotifications;
  final bool adNotifications;

  NotificationState({
    required this.chatNotifications,
    required this.callNotifications,
    required this.appNotifications,
    required this.adNotifications,
  });

  NotificationState copyWith({
    bool? chatNotifications,
    bool? callNotifications,
    bool? appNotifications,
    bool? adNotifications,
  }) {
    return NotificationState(
      chatNotifications: chatNotifications ?? this.chatNotifications,
      callNotifications: callNotifications ?? this.callNotifications,
      appNotifications: appNotifications ?? this.appNotifications,
      adNotifications: adNotifications ?? this.adNotifications,
    );
  }
}
