import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.6, end: 1.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        if (_animation.isCompleted) {
          _controller.repeat(reverse: true);
        }
      });
    });
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
        backgroundColor: Colors.black,
        title: const Text(
          "Tween Animation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 150 * _animation.value,
          height: 150 * _animation.value,
          child: const Icon(
            Icons.headset_rounded,
            size: 50,
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(-1, -1),
                spreadRadius: 1,
                blurRadius: 15,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
