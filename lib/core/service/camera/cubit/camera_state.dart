import 'dart:io';

class CameraState {
  final String? photoPath;
  final bool flash;
  final bool frontCamera;
  final List<File> recentImages;
  final bool isGalleryOpen; // Yeni alan eklendi

  CameraState({
    required this.photoPath,
    required this.flash,
    required this.frontCamera,
    required this.recentImages,
    this.isGalleryOpen = false, // default kapalı
  });

  factory CameraState.initial() => CameraState(
    photoPath: null,
    flash: false,
    frontCamera: false,
    recentImages: [],
    isGalleryOpen: false,
  );

  CameraState copyWith({
    String? photoPath,
    bool? flash,
    bool? frontCamera,
    List<File>? recentImages,
    bool? isGalleryOpen, // copyWith'a eklendi
  }) {
    return CameraState(
      photoPath: photoPath ?? this.photoPath,
      flash: flash ?? this.flash,
      frontCamera: frontCamera ?? this.frontCamera,
      recentImages: recentImages ?? this.recentImages,
      isGalleryOpen: isGalleryOpen ?? this.isGalleryOpen,
    );
  }
}
