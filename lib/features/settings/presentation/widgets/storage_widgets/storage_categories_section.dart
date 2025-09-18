import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'storage_category.dart';
import 'storage_category_card.dart';

/// Depolama kategorilerini gösteren bölüm widget'ı
/// Tüm kategorileri liste halinde gösterir
class StorageCategoriesSection extends StatelessWidget {
  final List<StorageCategory> categories;
  final double appDataSize;
  final double animationValue;

  const StorageCategoriesSection({
    super.key,
    required this.categories,
    required this.appDataSize,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    return [
      _buildCategoriesTitle(context),
      15.height,
      ..._buildCategoryCards(),
    ].column(crossAxisAlignment: CrossAxisAlignment.start);
  }

  /// Kategoriler başlığını oluşturur
  Widget _buildCategoriesTitle(BuildContext context) {
    return "Veri Kategorileri"
        .text(textStyle: context.titleLarge)
        .paddingHorizontal(16);
  }

  /// Kategori kartlarının listesini oluşturur
  List<Widget> _buildCategoryCards() {
    return categories
        .map(
          (category) => StorageCategoryCard(
            category: category,
            appDataSize: appDataSize,
            animationValue: animationValue,
          ),
        )
        .toList();
  }
}
