import 'package:flutter/material.dart';

class AppTransitions {
  AppTransitions._(); // instance oluşturulmaz

  /// Fade In (Ekrana yavaşça görünerek gelme)
  static RouteTransitionsBuilder fadeIn({Curve curve = Curves.easeInOut}) {
    return (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: curve),
        child: child,
      );
    };
  }

  /// Slide (Kayarak gelme) - yönü parametre ile ayarlanabilir
  static RouteTransitionsBuilder slide({
    Offset begin = const Offset(1.0, 0.0),
    Curve curve = Curves.easeOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final offset = Tween(
        begin: begin,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return SlideTransition(position: offset, child: child);
    };
  }

  /// Slide From Top (Yukarıdan kayarak gelme)
  static RouteTransitionsBuilder slideFromTop() =>
      slide(begin: const Offset(0, -1));

  /// Slide From Bottom (Aşağıdan kayarak gelme)
  static RouteTransitionsBuilder slideFromBottom() =>
      slide(begin: const Offset(0, 1));

  /// Slide From Left (Soldan kayarak gelme)
  static RouteTransitionsBuilder slideFromLeft() =>
      slide(begin: const Offset(-1, 0));

  /// Slide From Right (Sağdan kayarak gelme)
  static RouteTransitionsBuilder slideFromRight() =>
      slide(begin: const Offset(1, 0));

  /// Scale (Yaklaşma - uzaklaşma efekti)
  static RouteTransitionsBuilder scale({
    double begin = 0.8,
    double end = 1.0,
    Curve curve = Curves.easeOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final scale = Tween(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return ScaleTransition(scale: scale, child: child);
    };
  }

  /// Rotation (Dönme efekti)
  static RouteTransitionsBuilder rotation({
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.linear,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final rotate = Tween(
        begin: begin,
        end: end,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return RotationTransition(turns: rotate, child: child);
    };
  }

  /// Size Transition (Boyut küçülüp büyüyerek gelme)
  static RouteTransitionsBuilder size({
    Axis axis = Axis.vertical,
    Curve curve = Curves.easeInOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      return SizeTransition(
        sizeFactor: CurvedAnimation(parent: animation, curve: curve),
        axis: axis,
        child: child,
      );
    };
  }

  /// Fade + Scale (Hem kaybolma hem küçülme/büyüme)
  static RouteTransitionsBuilder fadeScale({
    double scaleBegin = 0.9,
    double scaleEnd = 1.0,
    Curve curve = Curves.easeOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: curve);
      final scale = Tween(
        begin: scaleBegin,
        end: scaleEnd,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return FadeTransition(
        opacity: fade,
        child: ScaleTransition(scale: scale, child: child),
      );
    };
  }

  /// Fade + Slide (Kayarak ve saydamlaşarak gelme)
  static RouteTransitionsBuilder fadeSlide({
    Offset begin = const Offset(0, 1),
    Curve curve = Curves.easeOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: curve);
      final offset = Tween(
        begin: begin,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: offset, child: child),
      );
    };
  }

  /// Scale + Rotation (Hem büyüyüp küçülme hem dönme)
  static RouteTransitionsBuilder scaleRotate({
    double scaleBegin = 0.8,
    double scaleEnd = 1.0,
    double rotateBegin = 0.0,
    double rotateEnd = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    return (context, animation, secondaryAnimation, child) {
      final scale = Tween(
        begin: scaleBegin,
        end: scaleEnd,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      final rotate = Tween(
        begin: rotateBegin,
        end: rotateEnd,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return ScaleTransition(
        scale: scale,
        child: RotationTransition(turns: rotate, child: child),
      );
    };
  }

  /// Flip Y (Y ekseninde kart çevirme)
  static RouteTransitionsBuilder flipY({Curve curve = Curves.easeInOut}) {
    return (context, animation, secondaryAnimation, child) {
      final rotate = Tween(
        begin: -1.0,
        end: 0.0,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return AnimatedBuilder(
        animation: rotate,
        builder: (context, childWidget) {
          final angle = rotate.value * 3.14159;
          return Transform(
            transform: Matrix4.rotationY(angle),
            alignment: Alignment.center,
            child: childWidget,
          );
        },
        child: child,
      );
    };
  }

  /// Flip X (X ekseninde kart çevirme)
  static RouteTransitionsBuilder flipX({Curve curve = Curves.easeInOut}) {
    return (context, animation, secondaryAnimation, child) {
      final rotate = Tween(
        begin: -1.0,
        end: 0.0,
      ).animate(CurvedAnimation(parent: animation, curve: curve));
      return AnimatedBuilder(
        animation: rotate,
        builder: (context, childWidget) {
          final angle = rotate.value * 3.14159;
          return Transform(
            transform: Matrix4.rotationX(angle),
            alignment: Alignment.center,
            child: childWidget,
          );
        },
        child: child,
      );
    };
  }

  /// Zoom In (Yaklaşarak ekrana girme)
  static RouteTransitionsBuilder zoomIn() =>
      scale(begin: 0.6, end: 1.0, curve: Curves.fastOutSlowIn);

  /// Zoom Out (Uzaklaşarak ekrana girme)
  static RouteTransitionsBuilder zoomOut() =>
      scale(begin: 1.2, end: 1.0, curve: Curves.easeInOut);

  /// Bounce In (Zıplayarak gelme)
  static RouteTransitionsBuilder bounceIn() =>
      scale(begin: 0.5, end: 1.0, curve: Curves.bounceOut);

  /// Elastic In (Yaylanarak gelme)
  static RouteTransitionsBuilder elasticIn() =>
      scale(begin: 0.5, end: 1.0, curve: Curves.elasticOut);

  /// Fade + Rotate (Saydam + dönerek gelme)
  static RouteTransitionsBuilder fadeRotate() {
    return (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: Curves.easeIn);
      final rotate = Tween(
        begin: -0.25,
        end: 0.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      return FadeTransition(
        opacity: fade,
        child: RotationTransition(turns: rotate, child: child),
      );
    };
  }

  /// Slide + Scale (Kayarak + büyüyüp küçülerek gelme)
  static RouteTransitionsBuilder slideScale({
    Offset begin = const Offset(1, 0),
  }) {
    return (context, animation, secondaryAnimation, child) {
      final slide = Tween(
        begin: begin,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      final scale = Tween(
        begin: 0.8,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      return SlideTransition(
        position: slide,
        child: ScaleTransition(scale: scale, child: child),
      );
    };
  }
}
