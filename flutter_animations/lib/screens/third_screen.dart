import 'package:flutter/material.dart';
import 'package:flutter_animations/builders/animation_card.dart';
import 'package:flutter_animations/model/data.dart';

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
      body: ListView.separated(
          itemBuilder: (context, index) => AnimationCard(animations[index]),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: animations.length),
    );
  }
}
