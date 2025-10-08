import 'package:get_it/get_it.dart';
import '../../core/service/camera/camera_service.dart';
import '../../core/service/network/dio_service.dart';
import '../../core/service/cache/shared_prefs_service.dart';
import 'package:whatsapp_clone/core/base/auth_base.dart';
import 'package:whatsapp_clone/core/service/auth/auth_services.dart';
import 'package:whatsapp_clone/features/auth_features/register/data/repository/sing_up_repository_impl.dart';
import 'package:whatsapp_clone/features/auth_features/register/domain/repository/sing_up_repository.dart';
import 'package:whatsapp_clone/features/auth_features/register/domain/usecase/sing_up_usecase.dart';
import 'package:whatsapp_clone/features/auth_features/login/domain/usecase/sign_in_usecase.dart';
import 'package:whatsapp_clone/features/auth_features/login/domain/repository/sign_in_repository.dart';
import 'package:whatsapp_clone/features/auth_features/login/data/repository/sign_in_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // SharedPreferences servisini başlat ve register et
  final sharedPrefs = SharedPrefsService.instance;
  await sharedPrefs.init();
  sl.registerSingleton<SharedPrefsService>(sharedPrefs);

  // camera
  sl.registerLazySingleton<CameraService>(() => CameraService());

  // Network
  sl.registerLazySingleton<DioService>(() => DioService());

  // Auth
  sl.registerLazySingleton<AuthBase>(() => AuthService());

  // Repositories
  sl.registerLazySingleton<SingUpRepository>(
    () => SingUpRepositoryImpl(sl<AuthBase>()),
  );
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(sl<AuthBase>()),
  );

  // Usecases
  sl.registerLazySingleton<SingUpUsecase>(
    () => SingUpUsecase(sl<SingUpRepository>()),
  );
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(sl<SignInRepository>()),
  );
}
