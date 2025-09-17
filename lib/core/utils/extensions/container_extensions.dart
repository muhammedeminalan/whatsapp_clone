// lib/core/extensions/container_extensions.dart
import 'package:flutter/material.dart';

extension ContainerExtensions on Widget {
  Widget container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    BoxConstraints? constraints,
    Decoration? decoration,
    Color? color,
    Decoration? foregroundDecoration,
    double? borderRadius,
    BoxShape shape = BoxShape.rectangle,
    Gradient? gradient,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
  }) {
    BoxDecoration? boxDecoration;

    if (decoration != null) {
      boxDecoration = decoration as BoxDecoration?;
    } else if (color != null ||
        borderRadius != null ||
        gradient != null ||
        border != null ||
        boxShadow != null) {
      boxDecoration = BoxDecoration(
        color: color,
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : null,
        gradient: gradient,
        border: border,
        boxShadow: boxShadow,
        shape: shape,
      );
    }

    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      constraints: constraints,
      decoration: boxDecoration,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
