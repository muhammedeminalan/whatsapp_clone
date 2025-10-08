import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/settings/presentation/views/setting_views/cubits/notification_cubit.dart';
import '../../features/settings/presentation/views/setting_views/cubits/storage_cubit.dart';
import '../theme/cubit/theme_cubit.dart';
import '../../core/service/camera/cubit/camera_cubit.dart';
import '../../features/botton_navigation/cubit/navigation_cubit.dart';
import 'package:whatsapp_clone/features/auth_features/register/presentation/bloc/register_bloc.dart';
import 'package:whatsapp_clone/features/auth_features/login/presentation/bloc/login_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
    BlocProvider<CameraCubit>(create: (_) => CameraCubit()),
    BlocProvider<NotificationCubit>(create: (_) => NotificationCubit()),
    BlocProvider<StorageCubit>(create: (_) => StorageCubit()),
    BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
    BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  ];
}
