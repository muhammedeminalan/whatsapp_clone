import 'package:flutter/material.dart';

/// Depolama kategorisi veri modeli
/// Her kategori için isim, boyut ve renk bilgilerini tutar
class StorageCategory {
  final String name;
  final double size;
  final Color color;

  StorageCategory({
    required this.name,
    required this.size,
    required this.color,
  });
}
