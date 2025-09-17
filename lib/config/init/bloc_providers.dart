import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/cubit/theme_cubit.dart';
import '../../core/service/camera/cubit/camera_cubit.dart';
import '../../features/botton_navigation/cubit/navigation_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
    BlocProvider<CameraCubit>(create: (_) => CameraCubit()),
  ];
}
