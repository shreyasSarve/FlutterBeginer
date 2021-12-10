import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SupermanShield extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        Path()
          ..moveTo(25,0)
          ..lineTo(125,0)
          ..lineTo(150,25)
          ..lineTo(75,125)
          ..lineTo(0,25)
          ..lineTo(25,0),
        Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth=10
          ..strokeJoin=StrokeJoin.round
          ..strokeCap=StrokeCap.round
          ..color=Colors.red
         
          );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
