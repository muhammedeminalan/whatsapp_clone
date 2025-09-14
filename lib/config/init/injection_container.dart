import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone/core/service/camera/camera_service.dart';
import 'package:whatsapp_clone/core/service/network/dio_service.dart';
import 'package:whatsapp_clone/core/service/cache/shared_prefs_service.dart';

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
}
