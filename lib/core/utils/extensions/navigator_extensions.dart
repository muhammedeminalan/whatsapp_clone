import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> pushPage<T>(Widget page) {
    return navigator.push(MaterialPageRoute(builder: (_) => page));
  }

  void pop<T extends Object?>([T? result]) {
    navigator.pop(result);
  }

  Future<T?> pushReplacementPage<T, TO>(Widget page, {TO? result}) {
    return navigator.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntilPage<T>(Widget page) {
    return navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }
}
