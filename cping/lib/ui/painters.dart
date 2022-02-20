import 'package:flutter/material.dart';

class LineCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;
    final startCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final endCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    double hght = size.height * 1 / 2;
    double start = size.width * 0;
    double end = size.width;
    double i = 0;
    while (start <= end) {
      canvas.drawLine(Offset(start, hght), Offset(start + 2, hght), paint);
      start += i;
      i += 0.5;
    }
    canvas.drawCircle(Offset(end, hght), 7, endCirclePaint);
    canvas.drawCircle(Offset(0, hght), 9, startCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.drawCircle(Offset(size.width - 10, 10), 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
