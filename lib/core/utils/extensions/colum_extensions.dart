import 'package:flutter/material.dart';

extension ColumnExtension on List<Widget> {
  /// Basit Column oluşturur, sadece temel parametreler mevcut
  Widget column({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    double spacing = 0.0, // children arasına boşluk eklemek için
  }) {
    List<Widget> spacedChildren = [];
    for (int i = 0; i < length; i++) {
      spacedChildren.add(this[i]);
      if (i != length - 1 && spacing > 0) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }

    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}
