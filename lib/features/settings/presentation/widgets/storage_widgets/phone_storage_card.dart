import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

/// Telefon depolama bilgilerini gösteren kart widget'ı
/// Dairesel progress bar ile kullanılan ve boş alan bilgilerini gösterir
class PhoneStorageCard extends StatelessWidget {
  final double usedStorage;
  final double totalStorage;
  final double animationValue;

  const PhoneStorageCard({
    super.key,
    required this.usedStorage,
    required this.totalStorage,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    // Sıfıra bölme hatasını önle
    final safeTotalStorage = totalStorage > 0 ? totalStorage : 1.0;
    final usedPercentage = usedStorage / safeTotalStorage;
    final freeSpace = safeTotalStorage - usedStorage;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: [
          "Telefon Depolaması".text(textStyle: context.titleLarge),
          20.height,
          _buildStorageContent(
            context,
            usedPercentage,
            freeSpace,
            safeTotalStorage,
          ),
        ].column(crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );
  }

  /// Depolama içeriğini oluşturur - progress bar ve bilgi satırı
  Widget _buildStorageContent(
    BuildContext context,
    double usedPercentage,
    double freeSpace,
    double safeTotalStorage,
  ) {
    return Column(
      children: [
        _buildCircularProgressIndicator(
          context,
          usedPercentage,
          safeTotalStorage,
        ),
        20.height,
        _buildStorageInfoRow(context, freeSpace),
      ],
    );
  }

  /// Dairesel progress bar widget'ı
  Widget _buildCircularProgressIndicator(
    BuildContext context,
    double usedPercentage,
    double safeTotalStorage,
  ) {
    return SizedBox(
      width: 190,
      height: 100,
      child: Stack(
        children: [
          _buildCircularProgressBar(usedPercentage),
          _buildCircularProgressText(context, usedPercentage, safeTotalStorage),
        ],
      ),
    );
  }

  /// Dairesel progress bar'ın kendisi
  Widget _buildCircularProgressBar(double usedPercentage) {
    return CircularProgressIndicator(
      value: usedPercentage * animationValue,
      strokeWidth: 12,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(
        _getStorageColor(usedPercentage),
      ),
    );
  }

  /// Progress bar üzerindeki metin
  Widget _buildCircularProgressText(
    BuildContext context,
    double usedPercentage,
    double safeTotalStorage,
  ) {
    return Center(
      child: [
        "${(usedStorage * animationValue).toStringAsFixed(1)} GB".text(
          textStyle: context.titleLarge,
        ),
        " / ${safeTotalStorage.toStringAsFixed(0)} GB".text(
          textStyle: context.bodyMedium,
        ),
      ].column(),
    );
  }

  /// Kullanılan ve boş alan bilgilerini gösteren satır
  Widget _buildStorageInfoRow(BuildContext context, double freeSpace) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStorageInfo(context, "Kullanılan", usedStorage, Colors.red),
        _buildStorageInfo(context, "Boş Alan", freeSpace, Colors.green),
      ],
    );
  }

  /// Tek bir depolama bilgi widget'ı (renk, etiket, boyut)
  Widget _buildStorageInfo(
    BuildContext context,
    String label,
    double size,
    Color color,
  ) {
    return Column(
      children: [
        _buildStorageColorIndicator(color),
        5.height,
        _buildStorageLabel(context, label),
        _buildStorageSize(context, size),
      ],
    );
  }

  /// Renk göstergesi dairesi
  Widget _buildStorageColorIndicator(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  /// Depolama etiketi
  Widget _buildStorageLabel(BuildContext context, String label) {
    return label.text(textStyle: context.bodySmall);
  }

  /// Depolama boyutu
  Widget _buildStorageSize(BuildContext context, double size) {
    return "${size.toStringAsFixed(1)} GB".text(textStyle: context.bodyMedium);
  }

  /// Kullanım oranına göre renk belirler
  Color _getStorageColor(double usageRatio) {
    return usageRatio > 0.8 ? Colors.red : Colors.blue;
  }
}
