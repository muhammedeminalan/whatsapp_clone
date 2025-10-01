import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/auth_features/login/presentation/views/login_view.dart';
import 'config/init/app_initializer.dart';
import 'config/init/bloc_providers.dart';
import 'config/theme/app_theme.dart';
import 'config/theme/cubit/theme_cubit.dart';

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
            home: LoginView(), //BottomNavigationView(),
          );
        },
      ),
    );
  }
}
