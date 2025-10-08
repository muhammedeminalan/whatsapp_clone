import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../enum/page_type.dart';
import '../widgets/custom_bottom_nav.dart';
import '../../conversations/presentation/views/conversations_view.dart';
import '../../settings/presentation/views/settings_views.dart';
import '../../situations/presentation/views/situations_view.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/core/service/cache/shared_prefs_service.dart';
import 'package:whatsapp_clone/features/auth_features/login/presentation/views/login_view.dart';

import '../cubit/navigation_cubit.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPrefsService>();
    final isLoggedIn = prefs.getBool('isLoggedIn', defaultValue: false);

    // Eğer giriş yapılmamışsa LoginView'a yönlendir
    if (!isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

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
