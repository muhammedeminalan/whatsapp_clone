import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'storage_category.dart';

/// Tek bir depolama kategorisini gösteren kart widget'ı
/// Kategori adı, ikonu, progress bar ve boyut bilgisini gösterir
class StorageCategoryCard extends StatelessWidget {
  final StorageCategory category;
  final double appDataSize;
  final double animationValue;

  const StorageCategoryCard({
    super.key,
    required this.category,
    required this.appDataSize,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    // Sıfıra bölme hatasını önle
    final safeAppDataSize = appDataSize > 0 ? appDataSize : 1.0;
    final percentage = category.size / safeAppDataSize;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: _buildCategoryListTile(context, percentage),
    );
  }

  /// Kategori list tile'ını oluşturur
  Widget _buildCategoryListTile(BuildContext context, double percentage) {
    return ListTile(
      leading: _buildCategoryIcon(),
      title: _buildCategoryTitle(context),
      subtitle: _buildCategoryProgress(percentage),
      trailing: _buildCategorySize(context),
    );
  }

  /// Kategori ikonunu oluşturur
  Widget _buildCategoryIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        _getCategoryIcon(category.name),
        color: category.color,
        size: 20,
      ),
    );
  }

  /// Kategori başlığını oluşturur
  Widget _buildCategoryTitle(BuildContext context) {
    return category.name.text(textStyle: context.titleMedium);
  }

  /// Kategori progress bar'ını oluşturur
  Widget _buildCategoryProgress(double percentage) {
    return LinearProgressIndicator(
      value: percentage * animationValue,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(category.color),
      minHeight: 4,
    );
  }

  /// Kategori boyutunu oluşturur
  Widget _buildCategorySize(BuildContext context) {
    return "${(category.size * animationValue).toStringAsFixed(1)} GB".text(
      textStyle: context.bodyMedium,
    );
  }

  /// Kategori adına göre ikon döndürür
  IconData _getCategoryIcon(String categoryName) {
    return _categoryIconMap[categoryName] ?? Icons.storage;
  }

  /// Kategori adları ve ikonları eşleştiren map
  static const Map<String, IconData> _categoryIconMap = {
    "Fotoğraflar": Icons.photo_library,
    "Sohbetler": Icons.chat,
    "Videolar": Icons.video_library,
    "Dosyalar": Icons.folder,
  };
}
