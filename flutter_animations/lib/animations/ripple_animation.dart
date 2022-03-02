import 'package:flutter/material.dart';
import 'package:flutter_animations/painters/circle_paint.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({Key? key}) : super(key: key);

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _colIndex = 0;
  final List<Color> _colorList = [
    Colors.blue,
    Colors.red,
    Colors.black,
    Colors.amber
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ripple Animation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            _colIndex++;
            _colIndex %= 3;
          }),
          child: CustomPaint(
            painter: CirclePaint(
              animation: _controller,
              color: _colorList[_colIndex],
            ),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
