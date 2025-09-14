// lib/core/services/camera_service.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/core/utils/extensions/log_extensions.dart';

enum CameraSource { camera, gallery }

class CameraService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({
    CameraSource source = CameraSource.camera,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source == CameraSource.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: maxWidth ?? 1080,
        maxHeight: maxHeight ?? 1080,
        imageQuality: imageQuality ?? 85,
      );
      if (pickedFile != null) return File(pickedFile.path);
      return null;
    } catch (e) {
      'CameraService error: $e'.errorLog();
      return null;
    }
  }
}
