import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../config/init/injection_container.dart';
import '../camera_service.dart';
import '../../../utils/extensions/log_extensions.dart';
import 'camera_state.dart';

/// Kamera işlemlerini yöneten Cubit
/// Fotoğraf çekme, galeri açma, flash, ön/arka kamera gibi durumları yönetir.
class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial()) {
    'CameraCubit initialized'.infoLog();
  }

  final CameraService _cameraService = sl<CameraService>();

  /// Flash durumunu değiştirir
  void toggleFlash() {
    final newFlash = !state.flash;
    emit(state.copyWith(flash: newFlash));
    'Flash toggled: $newFlash'.infoLog();
  }

  /// Ön/arka kamera arasında geçiş yapar
  void switchCamera() {
    final newCamera = !state.frontCamera;
    emit(state.copyWith(frontCamera: newCamera));
    'Camera switched. Front camera: $newCamera'.infoLog();
  }

  /// Kamera ile fotoğraf çeker
  Future<void> takePhoto() async {
    try {
      'Taking photo...'.infoLog();
      final File? file = await _cameraService.pickImage(
        source: CameraSource.camera,
        maxWidth: 1200,
        maxHeight: 1200,
      );
      if (file != null) {
        emit(state.copyWith(photoPath: file.path));
        'Photo taken: ${file.path}'.infoLog();
      } else {
        'No photo taken'.warningLog();
      }
    } catch (e) {
      'takePhoto error: $e'.errorLog();
    }
  }

  /// Telefon galerisini açar ve seçilen fotoğrafı state'e kaydeder
  Future<void> pickFromGallery() async {
    try {
      'Opening gallery...'.infoLog();
      final File? file = await _cameraService.pickImage(
        source: CameraSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
      );
      if (file != null) {
        emit(state.copyWith(photoPath: file.path));
        'Photo selected from gallery: ${file.path}'.infoLog();
      } else {
        'No photo selected from gallery'.warningLog();
      }
    } catch (e) {
      'pickFromGallery error: $e'.errorLog();
    }
  }

  /// toggleGallery artık direkt galeriyi açacak
  Future<void> toggleGallery() async {
    'toggleGallery called'.infoLog();
    await pickFromGallery();
  }

  /// Manuel olarak seçilen bir fotoğrafı state'e işler
  void selectPhoto(String path) {
    emit(state.copyWith(photoPath: path));
    'Photo manually selected: $path'.infoLog();
  }

  /// Son 30 galerideki resmi yükler
  Future<void> loadGallery() async {
    try {
      'Loading gallery...'.infoLog();
      final PermissionState permission =
          await PhotoManager.requestPermissionExtend();

      if (!permission.isAuth) {
        'Gallery permission denied'.warningLog();
        return;
      }

      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );

      if (albums.isEmpty) {
        'No albums found'.warningLog();
        return;
      }

      final List<AssetEntity> recentAssets = await albums.first
          .getAssetListPaged(page: 0, size: 30);

      final List<File> files = [];
      for (final asset in recentAssets) {
        final File? file = await asset.file;
        if (file != null) files.add(file);
      }

      emit(state.copyWith(recentImages: files));
      'Gallery loaded: ${files.length} images'.infoLog();
    } catch (e) {
      'loadGallery error: $e'.errorLog();
    }
  }

  /// Camera state'i sıfırlar
  void reset() {
    emit(
      CameraState(
        photoPath: null,
        recentImages: [],
        flash: false,
        frontCamera: false,
      ),
    );
    'Camera state reset'.infoLog();
  }
}
