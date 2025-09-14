// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/widgets/appBar/core_app_bar.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/features/camera/presentation/cubit/camera_cubit.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<AssetEntity> recentImages = [];

  @override
  void initState() {
    super.initState();
    _loadGallery();
  }

  Future<void> _loadGallery() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      final albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );
      if (albums.isNotEmpty) {
        final recent = albums.first;
        final recentAssets = await recent.getAssetListPaged(page: 0, size: 30);
        setState(() {
          recentImages = recentAssets;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraCubit(),
      child: Scaffold(
        appBar: CoreAppBar(titleText: "Camera"),

        body: Stack(
          children: [
            // Kamera veya seçilen fotoğraf
            BlocBuilder<CameraCubit, String?>(
              builder: (context, photoPath) {
                if (photoPath != null) {
                  return Image.file(
                    File(photoPath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                }
                return Center(
                  child: Text(
                    'Kamera açılacak...',
                    style: context.headlineLarge,
                  ),
                );
              },
            ),

            // 📌 Üstte galeri row
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: recentImages.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder<File?>(
                      future: recentImages[index].file,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            color: Colors.grey.shade800,
                          );
                        }
                        final file = snapshot.data!;
                        return GestureDetector(
                          onTap: () {
                            // ignore: invalid_use_of_visible_for_testing_member
                            context.read<CameraCubit>().emit(file.path);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
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
                    );
                  },
                ),
              ),
            ),

            // 📌 Kontroller altta
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Kamera
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CameraCubit>().takePhoto();
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.camera_alt, color: Colors.black),
                  ),

                  // Flash
                  BlocBuilder<CameraCubit, String?>(
                    builder: (context, _) {
                      final cubit = context.read<CameraCubit>();
                      return IconButton(
                        icon: Icon(
                          cubit.flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: cubit.toggleFlash,
                      );
                    },
                  ),

                  // Kamera değiştir
                  CostumIconButton(
                    icon: Icons.flip_camera_ios,
                    size: 35,

                    onTap: () {
                      context.read<CameraCubit>().switchCamera();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
