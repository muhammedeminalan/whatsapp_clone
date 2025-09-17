import 'package:flutter/material.dart';

extension ExpandedExtensions on Widget {
  /// Widget'ı Expanded ile sarar.
  /// [flex] parametresi ile Expanded flex değerini ayarlayabilirsin.
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
}
