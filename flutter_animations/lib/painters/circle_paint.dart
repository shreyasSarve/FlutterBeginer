import 'dart:math';

import 'package:flutter/material.dart';

class CirclePaint extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  CirclePaint({required this.animation,this.color=Colors.blue}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; --wave) {
      circle(canvas, wave + animation.value, rect);
    }
  }

  circle(Canvas canvas, double value, Rect rect) {
    double opacity = (1.0 - value / 4).clamp(.0, 1.0);
    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);
    final paint = Paint()..color = color.withOpacity(opacity);
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
