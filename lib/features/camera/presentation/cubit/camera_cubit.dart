import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/core/service/camera/camera_service.dart';

class CameraCubit extends Cubit<String?> {
  CameraCubit() : super(null);

  final CameraService _cameraService = sl<CameraService>();

  bool _flash = false;
  bool _frontCamera = false;

  bool get flash => _flash;
  bool get frontCamera => _frontCamera;

  void toggleFlash() {
    _flash = !_flash;
    emit(state); // UI güncellemesi için emit
  }

  void switchCamera() {
    _frontCamera = !_frontCamera;
    emit(state); // UI güncellemesi için emit
  }

  Future<void> takePhoto() async {
    final file = await _cameraService.pickImage(
      source: CameraSource.camera,
      maxWidth: 1200,
      maxHeight: 1200,
    );
    if (file != null) emit(file.path);
  }

  Future<void> pickFromGallery() async {
    final file = await _cameraService.pickImage(
      source: CameraSource.gallery,
      maxWidth: 1200,
      maxHeight: 1200,
    );
    if (file != null) emit(file.path);
  }
}
