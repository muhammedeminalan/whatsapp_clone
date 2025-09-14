import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/init/app_initializer.dart';
import 'package:whatsapp_clone/config/init/bloc_providers.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/config/routes/app_route.dart';
import 'package:whatsapp_clone/config/theme/app_theme.dart';
import 'package:whatsapp_clone/config/theme/cubit/theme_cubit.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _appRouter = sl<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.providers,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'whatsapp_clone',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
