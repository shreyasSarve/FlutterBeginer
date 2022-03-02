import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/ripple_animation.dart';
import 'package:flutter_animations/animations/tween_animation.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Flutter Animations"),
        leading: const Icon(
          Icons.abc,
          size: 40,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RippleAnimation(),
                  ),
                );
              },
              child: const Text("Click Me Plz")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TweenAnimation(),
                  ),
                );
              },
              child: const Text("Click Me Plz")),
        ],
      ),
    );
  }
}
