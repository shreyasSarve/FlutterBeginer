import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

class ClockPainter extends CustomPainter {
  Color color;
  ClockPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.height / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    final sweepAngleMinutes = (duration.inMilliseconds / 60000) % 60 * pi / 30;
    final rectSeconds = Rect.fromCircle(center: center, radius: (radius + 10));
    const startAngle = -pi / 2;
    final sweepAngleSeconds = (duration.inMilliseconds / 1000) % 60 * pi / 30;
    const useCenter = false;

    final kateBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final secondsSweeper = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..color = Colors.blueGrey.shade500;

    final secondHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Colors.red
      ..strokeWidth = 4;

    final minuteHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Colors.amber;

    final centerCircleBrush = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 4;

    paintKate(canvas, center, radius, kateBrush);
    paintHands(canvas, minuteHandBrush, sweepAngleMinutes, radius, center);
    paintHands(canvas, secondHandBrush, sweepAngleSeconds, radius, center);

    canvas.drawCircle(center, 4 / 15 * radius, centerCircleBrush);

    if (sweepAngleSeconds != 0) {
      canvas.drawArc(rectSeconds, startAngle, sweepAngleSeconds, useCenter,
          secondsSweeper);
    } else {
      canvas.drawCircle(Offset(centerX, centerY - radius + 20), 5,
          secondsSweeper..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

paintHands(Canvas canvas, Paint brush, double sweepAngle, double radius,
    Offset center) {
  double x = (radius - 50) * sin(sweepAngle) + center.dx;
  double y = -(radius - 50) * cos(sweepAngle) + center.dy;
  double len = 20;
  const theta = pi / 8;
  double alpha = -sweepAngle;
  double xa = center.dx + len * cos(theta + alpha);
  double ya = center.dy - len * sin(theta + alpha);
  double xb = center.dx - len * cos(alpha - theta);
  double yb = center.dy + len * sin(alpha - theta);

  final hand = Path()
    ..moveTo(center.dx, center.dy)
    ..lineTo(xa, ya)
    ..moveTo(center.dx, center.dy)
    ..lineTo(xb, yb)
    ..lineTo(x, y)
    ..lineTo(xa, ya);

  canvas.drawPath(hand, brush);
}

paintKate(Canvas canvas, Offset center, double radius, Paint brush) {
  for (int i = 0; i < 360; i += 3) {
    double diff = 5;
    brush.color = Colors.black38;

    if (i % 6 == 0) {
      diff = 10;
      brush.color = Colors.black38;
    }

    if (i % 30 == 0) {
      diff = 20;
      brush.color = Colors.black;
    }

    double x1 = center.dx + radius * cos(i * pi / 180);
    double y1 = center.dy + radius * sin(i * pi / 180);

    double x2 = center.dx + (radius - diff) * cos(i * pi / 180);
    double y2 = center.dy + (radius - diff) * sin(i * pi / 180);

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), brush);
  }
}

paintSweepingCircle(
    Canvas canvas, double radius, Offset center, double sweepAngle) {}
