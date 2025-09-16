import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/theme/cubit/theme_cubit.dart';
import 'package:whatsapp_clone/core/service/camera/cubit/camera_cubit.dart';
import 'package:whatsapp_clone/features/botton_navigation/cubit/navigation_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
    BlocProvider<CameraCubit>(create: (_) => CameraCubit()),
  ];
}
