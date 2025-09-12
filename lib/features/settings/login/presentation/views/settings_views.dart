// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';
import 'package:whatsapp_clone/core/widgets/appBar/core_app_bar.dart';
import 'package:whatsapp_clone/features/settings/login/presentation/widgets/profil_card.dart';
import 'package:whatsapp_clone/features/settings/login/presentation/widgets/settinngs_card.dart';

import '../../../../../config/theme/cubit/theme_cubit.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profilCard(),
            30.height,
            Text(
              "Kullanıcı Bilgileri",
              style: context.titleSmall,
            ).paddingHorizontal(15),
            SettinngsCard(settingsName: "Kullanıcı Adı"),
            SettinngsCard(settingsName: "Telefon Numarası"),
            SettinngsCard(settingsName: "E-posta"),
            SettinngsCard(settingsName: "Hakkında"),

            30.height,
            Text(
              "Sobet Bilgileri",
              style: context.titleSmall,
            ).paddingHorizontal(15),
            SettinngsCard(settingsName: "Sohbetler"),
            SettinngsCard(settingsName: "Bildirimler"),
            SettinngsCard(settingsName: "Tüm Sohbeti Sil"),
            SettinngsCard(settingsName: "Depolama ve Veri"),
            30.height,
            Text("Tema", style: context.titleSmall).paddingHorizontal(15),
            _temaSwitch(context),
          ],
        ).paddingOnly(top: 10),
      ),
    );
  }

  Card _temaSwitch(BuildContext context) {
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
    );
  }

  ProfilCard _profilCard() {
    return ProfilCard(
      profilPhoto: "https://i.pravatar.cc/300",
      userName: "Muhammet Emin",
      biography: "Flutter Developer",
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(titleText: "Ayarlar");
  }
}
