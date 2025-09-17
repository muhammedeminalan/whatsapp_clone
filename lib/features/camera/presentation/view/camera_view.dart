import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service/camera/cubit/camera_cubit.dart';
import '../../../../core/service/camera/cubit/camera_state.dart';
import '../../../../core/widgets/index.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CameraCubit>().loadGallery();

    return Scaffold(
      appBar: const CoreAppBar(titleText: "Camera"),

      // Alt bar bottomNavigationBar ile sabit
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            const Spacer(), // solda boşluk
            IconButton(
              icon: const Icon(Icons.camera_alt, size: 50),
              onPressed: () => context.read<CameraCubit>().takePhoto(),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.photo_library, size: 35),
              onPressed: () => context.read<CameraCubit>().toggleGallery(),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          // Kamera veya seçilen fotoğraf
          BlocBuilder<CameraCubit, CameraState>(
            builder: (context, state) {
              if (state.photoPath != null) {
                return Image.file(
                  File(state.photoPath!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              }
              return const Center();
            },
          ),

          // Üstte flash ve kamera değiştir
          Positioned(
            top: 20,
            right: 10,
            child: Column(
              children: [
                BlocBuilder<CameraCubit, CameraState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Icon(
                        state.flash ? Icons.flash_on : Icons.flash_off,
                        size: 35,
                      ),
                      onPressed: () =>
                          context.read<CameraCubit>().toggleFlash(),
                    );
                  },
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: const Icon(Icons.flip_camera_ios, size: 35),
                  onPressed: () => context.read<CameraCubit>().switchCamera(),
                ),
              ],
            ),
          ),

          // Animasyonlu galeri paneli alt barın üstünde
          BlocBuilder<CameraCubit, CameraState>(
            builder: (context, state) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: 0,
                right: 0,
                // bottomNavigationBar yüksekliği = 100
                bottom: state.isGalleryOpen ? 0 : -250,
                height: 120,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: state.recentImages.isEmpty
                      ? const Center(
                          child: Text(
                            'Galeride fotoğraf yok',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: state.recentImages.length,
                          itemBuilder: (context, index) {
                            final file = state.recentImages[index];
                            return GestureDetector(
                              onTap: () => context
                                  .read<CameraCubit>()
                                  .selectPhoto(file.path),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(file),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
