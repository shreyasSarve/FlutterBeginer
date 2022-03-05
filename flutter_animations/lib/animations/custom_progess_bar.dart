import 'dart:math';

import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({Key? key}) : super(key: key);

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _sweepAnimation;
  late AnimationController _animationController;
  late Animation<double> _startAngleAnimation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _sweepAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _startAngleAnimation =
        Tween<double>(begin: 0.0, end: 4.0).animate(_animationController);
    _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Custom Progress Bar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(5),
              child: CustomPaint(
                painter: Custom(_sweepAnimation, _startAngleAnimation),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Custom extends CustomPainter {
  final Animation<double> _sweepAnimation;
  final Animation<double> _startAngleAnimation;
  Custom(this._sweepAnimation, this._startAngleAnimation);
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Offset center = Offset(width / 2, height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    final rect = Rect.fromCenter(center: center, width: width, height: height);
    final startAngle =  pi * _startAngleAnimation.value;
    final sweepAngle = ((2 * pi)) * _sweepAnimation.value;
    const useCenter = false;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
