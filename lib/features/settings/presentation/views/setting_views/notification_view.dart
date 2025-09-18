// UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/core/widgets/index.dart';
import 'package:whatsapp_clone/features/settings/presentation/views/setting_views/cubits/notification_cubit.dart';

import '../../widgets/notification_switch_tile.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppBar(titleText: "Bildirim ayarları"),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          final cubit = context.read<NotificationCubit>();
          return [
            NotificationSwitchTile(
              title: "Sohbet Bildirimleri",
              value: state.chatNotifications,
              onChanged: cubit.toggleChat,
              description: state.chatNotifications
                  ? "Sohbetleriniz için bildirimler açık."
                  : "Sohbetleriniz için bildirim almayacaksınız.",
            ),
            context.divider(),
            NotificationSwitchTile(
              title: "Arama Bildirimleri",
              value: state.callNotifications,
              onChanged: cubit.toggleCall,
              description: state.callNotifications
                  ? "Gelen aramalar için bildirimler açık."
                  : "Gelen aramalar için bildirim almayacaksınız.",
            ),
            context.divider(),

            NotificationSwitchTile(
              title: "Uygulama Bildirimleri",
              value: state.appNotifications,
              onChanged: cubit.toggleApp,
              description: state.appNotifications
                  ? "Uygulama içi bildirimler açık."
                  : "Uygulama içi bildirimler devre dışı bırakıldı.",
            ),
            context.divider(),

            NotificationSwitchTile(
              title: "Reklam Bildirimleri",
              value: state.adNotifications,
              onChanged: cubit.toggleAd,
              description: state.adNotifications
                  ? "Tanıtım ve kampanya bildirimleri açık."
                  : "Tanıtım ve kampanya bildirimleri almayacaksınız.",
            ),
            context.divider(),
          ].column(crossAxisAlignment: CrossAxisAlignment.start);
        },
      ),
    );
  }
}
