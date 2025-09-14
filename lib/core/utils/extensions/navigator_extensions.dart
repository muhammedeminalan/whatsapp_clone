import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> pushPage<T>(
    Widget page, {
    bool fullscreenDialog = false,
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    if (transitionBuilder != null) {
      // Not: PageRouteBuilder fullscreenDialog parametresi desteklemez
      return navigator.push(
        PageRouteBuilder(
          pageBuilder: (_, _, _) => page,
          transitionsBuilder: transitionBuilder,
          transitionDuration: transitionDuration,
        ),
      );
    } else {
      return navigator.push(
        MaterialPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog,
        ),
      );
    }
  }

  void pop<T extends Object?>([T? result]) {
    navigator.pop(result);
  }

  Future<T?> pushReplacementPage<T, TO>(
    Widget page, {
    TO? result,
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    if (transitionBuilder != null) {
      return navigator.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, _, _) => page,
          transitionsBuilder: transitionBuilder,
          transitionDuration: transitionDuration,
        ),
        result: result,
      );
    } else {
      return navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
        result: result,
      );
    }
  }

  Future<T?> pushAndRemoveUntilPage<T>(
    Widget page, {
    RoutePredicate? predicate, // artık nullable
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    final pred =
        predicate ??
        (Route<dynamic> route) => false; // default: tüm stack temizlensin

    if (transitionBuilder != null) {
      return navigator.pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (_, _, _) => page,
          transitionsBuilder: transitionBuilder,
          transitionDuration: transitionDuration,
        ),
        pred,
      );
    } else {
      return navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        pred,
      );
    }
  }

  // Named route kısayolları
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigator.pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }
}
