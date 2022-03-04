import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _animationController;
  final zoomIn = const Icon(
    Icons.zoom_in,
    size: 50,
    color: Colors.black,
  );
  final zoomOut = const Icon(
    Icons.zoom_out,
    size: 50,
    color: Colors.black,
  );
  bool pressed = false;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color col = pressed ? Colors.red : Colors.green;
    Icon icon = pressed ? zoomOut : zoomIn;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Animated Buttom",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              pressed = !pressed;
            });
            if (pressed) {
              setState(() {
                _animationController.forward();
              });
            } else {
              setState(() {
                _animationController.reverse();
              });
            }
          },
          child: Transform.scale(
            scale: 0.3 * animation.value + 1,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: col,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-1, -1),
                    spreadRadius: -1,
                    blurRadius: 15,
                    color: col,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: 2 * pi * animation.value,
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
