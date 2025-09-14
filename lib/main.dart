import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/init/app_initializer.dart';
import 'package:whatsapp_clone/config/init/bloc_providers.dart';
import 'package:whatsapp_clone/config/theme/app_theme.dart';
import 'package:whatsapp_clone/config/theme/cubit/theme_cubit.dart';
import 'package:whatsapp_clone/features/botton_navigation/view/bottom_navigation_view.dart';

Future<void> main() async {
  await initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'whatsapp_clone',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            home: BottomNavigationView(),
          );
        },
      ),
    );
  }
}
