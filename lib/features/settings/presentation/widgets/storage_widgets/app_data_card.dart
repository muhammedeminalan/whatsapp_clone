import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

/// Uygulama veri kullanımını gösteren kart widget'ı
/// Doğrusal progress bar ile uygulama veri boyutunu gösterir
class AppDataCard extends StatelessWidget {
  final double appDataSize;
  final double animationValue;

  const AppDataCard({
    super.key,
    required this.appDataSize,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: [
          "Uygulama Verisi".text(textStyle: context.titleLarge),
          15.height,
          _buildAppDataContent(context),
        ].column(crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );
  }

  /// Uygulama veri içeriğini oluşturur
  Widget _buildAppDataContent(BuildContext context) {
    return Column(
      children: [
        _buildLinearProgressIndicator(context),
        15.height,
        _buildAppDataTotalText(context),
      ],
    );
  }

  /// Doğrusal progress bar widget'ı
  Widget _buildLinearProgressIndicator(BuildContext context) {
    return Column(
      children: [
        _buildLinearProgressBar(),
        10.height,
        _buildLinearProgressLabels(context),
      ],
    );
  }

  /// Progress bar'ın kendisi
  Widget _buildLinearProgressBar() {
    return LinearProgressIndicator(
      value: animationValue,
      backgroundColor: Colors.grey[300],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      minHeight: 8,
    );
  }

  /// Progress bar altındaki etiketler
  Widget _buildLinearProgressLabels(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "0 GB".text(textStyle: context.bodySmall),
        "${(appDataSize * animationValue).toStringAsFixed(1)} GB".text(
          textStyle: context.bodyMedium,
        ),
      ],
    );
  }

  /// Toplam uygulama veri boyutu metni
  Widget _buildAppDataTotalText(BuildContext context) {
    return "Toplam: ${appDataSize.toStringAsFixed(1)} GB".text(
      textStyle: context.bodyMedium,
    );
  }
}
