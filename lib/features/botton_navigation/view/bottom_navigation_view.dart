import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/botton_navigation/enum/page_type.dart';
import '../widgets/custom_bottom_nav.dart';
import '../../conversations/presentation/views/conversations_view.dart';
import '../../settings/presentation/views/settings_views.dart';
import '../../situations/presentation/views/situations_view.dart';

import '../cubit/navigation_cubit.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationTab>(
        builder: (context, state) {
          switch (state) {
            case NavigationTab.conversations:
              return const SituationsView();
            case NavigationTab.situations:
              return ConversationsView();
            case NavigationTab.settings:
              return const SettingsView();
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
