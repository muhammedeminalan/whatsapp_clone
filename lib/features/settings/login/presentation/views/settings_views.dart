// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/widgets/core_app_bar.dart';

import '../../../../../config/theme/cubit/theme_cubit.dart';

class SettingsViews extends StatefulWidget {
  const SettingsViews({super.key});

  @override
  State<SettingsViews> createState() => _SettingsViewsState();
}

class _SettingsViewsState extends State<SettingsViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: Column(children: [
          
        ],
      ),
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(
      titleText: "Ayarlar",
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
      ],
    );
  }
}
