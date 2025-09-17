import 'package:flutter/material.dart';

extension SizeboxExtensions on Widget {
  SizedBox sizebox({double? h, double? w}) =>
      SizedBox(height: h, width: w, child: this);
}
