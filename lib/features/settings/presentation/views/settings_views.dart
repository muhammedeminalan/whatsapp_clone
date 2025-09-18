// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/transitions/app_transitions.dart';
import 'package:whatsapp_clone/features/settings/presentation/views/setting_views/chat_view.dart';
import 'package:whatsapp_clone/features/settings/presentation/views/setting_views/notification_view.dart';
import 'package:whatsapp_clone/features/settings/presentation/views/setting_views/storage_view.dart';
import 'package:whatsapp_clone/features/settings/presentation/views/settings_profil_views.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/profil_card.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/settinngs_card.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/core/widgets/index.dart';
import '../../../../config/theme/cubit/theme_cubit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool get isDark => context.read<ThemeCubit>().state == ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: SingleChildScrollView(
        child: [
          20.height,
          _profilCard(context),
          20.height,

          "Sobet Bilgileri"
              .text(textStyle: context.titleSmall)
              .paddingHorizontal(15),
          SettinngsCard(
            settingsName: "Sohbetler",
            onTap: () => context.pushPage(ChatView(), fullscreenDialog: true),
          ),
          SettinngsCard(
            settingsName: "Bildirimler",
            onTap: () => context.pushPage(NotificationView()),
          ),
          SettinngsCard(settingsName: "Tüm Sohbeti Sil"),
          SettinngsCard(
            settingsName: "Depolama ve Veri",
            onTap: () {
              context.pushPage(StorageView());
            },
          ),
          30.height,
          "Tema".text(textStyle: context.titleSmall).paddingHorizontal(15),
          _temaSwitch(context),
        ].column(crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );
  }

  Widget _temaSwitch(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        title: Text(
          isDark ? "Koyu Tema" : "Açık Tema",
          style: context.titleMedium,
        ),
        trailing: Switch(
          value: isDark,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
      ),
    ).paddingHorizontal(8);
  }

  ProfilCard _profilCard(BuildContext context) {
    return ProfilCard(
      onTap: () => context.pushPage(
        SettingsProfilViews(),

        transitionBuilder: AppTransitions.slideFromBottom(),
      ),
      profilPhoto: "https://i.pravatar.cc/300",
      userName: "Muhammet Emin",
      biography: "Flutter Developer",
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(titleText: "Ayarlar");
  }
}
