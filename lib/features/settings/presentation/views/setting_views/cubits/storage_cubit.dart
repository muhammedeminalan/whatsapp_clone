import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../widgets/storage_widgets/storage_category.dart';
import '../../../services/storage_service.dart';

/// Depolama durumunu yöneten cubit sınıfı
/// Cihaz depolama bilgilerini yükler ve yönetir
class StorageCubit extends Cubit<StorageState> {
  StorageCubit() : super(StorageInitial()) {
    _loadStorageData();
  }

  /// Depolama verilerini yükler
  Future<void> _loadStorageData() async {
    emit(StorageLoading());

    try {
      // Paralel olarak tüm depolama verilerini al
      final results = await Future.wait([
        StorageService.getTotalStorage(),
        StorageService.getUsedStorage(),
        StorageService.getAppDataSize(),
        StorageService.getCategorySizes(),
      ]);

      final totalStorage = results[0] as double;
      final usedStorage = results[1] as double;
      final appDataSize = results[2] as double;
      final categorySizes = results[3] as Map<String, double>;

      // Kategorileri oluştur
      final categories = [
        StorageCategory(
          name: "Fotoğraflar",
          size: categorySizes['Fotoğraflar'] ?? 0.0,
          color: Colors.blue,
        ),
        StorageCategory(
          name: "Sohbetler",
          size: categorySizes['Sohbetler'] ?? 0.0,
          color: Colors.green,
        ),
        StorageCategory(
          name: "Videolar",
          size: categorySizes['Videolar'] ?? 0.0,
          color: Colors.orange,
        ),
        StorageCategory(
          name: "Dosyalar",
          size: categorySizes['Dosyalar'] ?? 0.0,
          color: Colors.purple,
        ),
      ];

      emit(
        StorageLoaded(
          totalStorage: totalStorage,
          usedStorage: usedStorage,
          appDataSize: appDataSize,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(StorageError(e.toString()));
    }
  }

  /// Depolama verilerini yeniden yükler
  Future<void> refreshStorageData() async {
    await _loadStorageData();
  }
}

/// Depolama durumları için base sınıf
abstract class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object?> get props => [];
}

/// İlk durum - veriler yüklenmemiş
class StorageInitial extends StorageState {}

/// Yükleme durumu - veriler yükleniyor
class StorageLoading extends StorageState {}

/// Yüklendi durumu - veriler başarıyla yüklendi
class StorageLoaded extends StorageState {
  final double totalStorage;
  final double usedStorage;
  final double appDataSize;
  final List<StorageCategory> categories;

  const StorageLoaded({
    required this.totalStorage,
    required this.usedStorage,
    required this.appDataSize,
    required this.categories,
  });

  @override
  List<Object?> get props => [
    totalStorage,
    usedStorage,
    appDataSize,
    categories,
  ];
}

/// Hata durumu - veri yükleme sırasında hata oluştu
class StorageError extends StorageState {
  final String message;

  const StorageError(this.message);

  @override
  List<Object?> get props => [message];
}
