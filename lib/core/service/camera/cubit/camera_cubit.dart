import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/core/service/camera/camera_service.dart';
import 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial());

  final CameraService _cameraService = sl<CameraService>();

  void toggleFlash() => emit(state.copyWith(flash: !state.flash));

  void switchCamera() => emit(state.copyWith(frontCamera: !state.frontCamera));

  Future<void> takePhoto() async {
    final file = await _cameraService.pickImage(
      source: CameraSource.camera,
      maxWidth: 1200,
      maxHeight: 1200,
    );
    if (file != null) emit(state.copyWith(photoPath: file.path));
  }

  Future<void> pickFromGallery() async {
    final file = await _cameraService.pickImage(
      source: CameraSource.gallery,
      maxWidth: 1200,
      maxHeight: 1200,
    );
    if (file != null) emit(state.copyWith(photoPath: file.path));
  }

  void selectPhoto(String path) => emit(state.copyWith(photoPath: path));

  Future<void> loadGallery() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return;

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    if (albums.isEmpty) return;

    final recentAssets = await albums.first.getAssetListPaged(
      page: 0,
      size: 30,
    );
    final files = <File>[];

    for (var asset in recentAssets) {
      final file = await asset.file;
      if (file != null) files.add(file);
    }

    emit(state.copyWith(recentImages: files));
  }

  bool toggleGallery() {
    final newState = !state.isGalleryOpen; // yeni durum
    emit(state.copyWith(isGalleryOpen: newState)); // Cubit'e emit et
    return newState; // bool olarak geri döndür
  }

  // camera_cubit.dart
  void reset() {
    emit(
      CameraState(
        photoPath: null,
        recentImages: [],
        flash: false,
        frontCamera: false,
      ),
    );
  }
}
