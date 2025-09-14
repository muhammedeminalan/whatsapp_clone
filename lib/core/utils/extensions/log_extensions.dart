// lib/core/extensions/log_extensions.dart
import 'dart:developer';

import 'package:flutter/material.dart';

extension LogExtensions on String {
  /// Normal debug print
  void debugLog() {
    debugPrint(this);
  }

  /// Info seviyesi log, Android Studio’da sarı renk
  void infoLog({String name = 'INFO'}) {
    log(this, name: name, level: 800); // 800 = info
  }

  /// Warning seviyesi log, turuncu renk
  void warningLog({String name = 'WARNING'}) {
    log(this, name: name, level: 900); // 900 = warning
  }

  /// Error seviyesi log, kırmızı renk
  void errorLog({String name = 'ERROR'}) {
    log(this, name: name, level: 1000); // 1000 = error
  }
}
