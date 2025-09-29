import 'package:flutter/material.dart';

/// Özelleştirilebilir liste başlığı (ListTile) widget'ı.
///
/// Bu widget tamamen esnektir ve aşağıdaki özellikleri sunar:
/// - Başında ve sonunda isteğe bağlı ikonlar gösterebilir.
/// - İsteğe bağlı alt başlık (subtitle) gösterebilir.
/// - Badge (rozet) ile ek bilgi gösterebilir.
/// - İsteğe bağlı olarak Card ile sarılabilir ve Card özellikleri keyfi ayarlanabilir.
/// - Renkler tamamen keyfi, hiçbir varsayılan veya tema rengi yoktur.
/// - Elevation, border radius ve tıklama davranışı tamamen keyfi.
class CustomListTitle extends StatelessWidget {
  /// Liste başlığı metni.
  final String? title;

  /// Başta gösterilecek ikon.
  final IconData? leadingIcon;

  /// Başta gösterilecek ikon rengi. Null ise renk yok.
  final Color? leadingIconColor;

  /// Sonda gösterilecek ikon.
  final IconData? trailingIcon;

  /// Sonda gösterilecek ikon rengi. Null ise renk yok.
  final Color? trailingIconColor;

  /// Card kullanılsın mı? (true/false)
  final bool? useCard;

  /// Card arka plan rengi. Null ise renk yok.
  final Color? cardColor;

  /// Card elevation değeri. Null ise elevation yok.
  final double? cardElevation;

  /// Card köşe yuvarlama radius değeri. Null ise radius yok.
  final double? cardBorderRadius;

  /// Başlık rengi. Null ise renk yok.
  final Color? titleColor;

  /// Tile tıklama callback fonksiyonu.
  final VoidCallback? onTap;

  /// Alt başlık gösterilsin mi? (true/false)
  final bool? showSubtitle;

  /// Alt başlık metni.
  final String? subtitle;

  /// Alt başlık rengi. Null ise renk yok.
  final Color? subtitleColor;

  /// Badge (rozet) gösterilsin mi? (true/false)
  final bool? showBadge;

  /// Badge metni.
  final String? badgeText;

  /// Badge arka plan rengi. Null ise renk yok.
  final Color? badgeColor;

  /// Badge metin rengi. Null ise renk yok.
  final Color? badgeTextColor;

  const CustomListTitle({
    super.key,
    this.title,
    this.leadingIcon,
    this.leadingIconColor,
    this.trailingIcon,
    this.trailingIconColor,
    this.useCard,
    this.cardColor,
    this.cardElevation,
    this.cardBorderRadius,
    this.titleColor,
    this.onTap,
    this.showSubtitle,
    this.subtitle,
    this.subtitleColor,
    this.showBadge,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    // Liste elemanı
    Widget tile = ListTile(
      leading: leadingIcon != null
          ? Icon(leadingIcon, color: leadingIconColor)
          : null,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
            )
          : null,
      subtitle: (showSubtitle == true && subtitle != null)
          ? Text(subtitle!, style: TextStyle(color: subtitleColor))
          : null,
      trailing: (showBadge == true && badgeText != null) || trailingIcon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showBadge == true && badgeText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badgeText!,
                      style: TextStyle(color: badgeTextColor, fontSize: 12),
                    ),
                  ),
                if (trailingIcon != null) const SizedBox(width: 8),
                if (trailingIcon != null)
                  Icon(trailingIcon, color: trailingIconColor),
              ],
            )
          : null,
      onTap: onTap,
    );

    // Card kullanımı
    if (useCard == true) {
      tile = Card(
        color: cardColor,
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius ?? 0),
        ),
        child: tile,
      );
    }

    return tile;
  }
}
