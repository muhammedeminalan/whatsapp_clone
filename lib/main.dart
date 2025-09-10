import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/theme/app_theme.dart';
import 'features/conversations/presentation/views/conversations_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme(); // SOLID yapımızdaki AppTheme

    return MaterialApp(
      title: 'whatsapp_clone',
      debugShowCheckedModeBanner: false,
      theme: appTheme.dark,
      home: const ConversationsView(),
    );
  }
}
