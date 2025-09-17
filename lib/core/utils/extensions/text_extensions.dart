// lib/core/extensions/text_extensions.dart
import 'package:flutter/material.dart';

extension TextExtensions on String {
  /// Text widget oluşturmak için extension
  /// [textStyle] verilirse direkt kullanılır
  Widget text({
    Key? key,
    TextStyle? textStyle,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool softWrap = true,
    Locale? locale,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return Text(
      this,
      key: key,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      locale: locale,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
