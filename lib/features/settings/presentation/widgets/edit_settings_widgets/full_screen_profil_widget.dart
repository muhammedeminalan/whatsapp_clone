import 'package:flutter/material.dart';
import '../../../../../core/utils/extensions/index.dart';

class FullScreenProfilWidget extends StatefulWidget {
  final String imageUrl;

  const FullScreenProfilWidget({super.key, required this.imageUrl});

  @override
  State<FullScreenProfilWidget> createState() => _FullScreenProfilWidgetState();
}

class _FullScreenProfilWidgetState extends State<FullScreenProfilWidget>
    with SingleTickerProviderStateMixin {
  double offsetY = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.height;

    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            offsetY += details.delta.dy;
          });
        },
        onVerticalDragEnd: (details) {
          if (offsetY.abs() > screenHeight / 4) {
            Navigator.of(context).pop();
          } else {
            setState(() {
              offsetY = 0;
            });
          }
        },
        child: Stack(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, offsetY),
                child: Hero(
                  tag: widget.imageUrl,
                  child: Image.network(
                    widget.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
