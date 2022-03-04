import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WavyTextAnimation extends StatefulWidget {
  const WavyTextAnimation({Key? key}) : super(key: key);

  @override
  State<WavyTextAnimation> createState() => _WavyTextAnimationState();
}

class _WavyTextAnimationState extends State<WavyTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Animation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      WavyAnimatedText(
                        "Hello !",
                        speed: const Duration(milliseconds: 200),
                      ),
                      WavyAnimatedText(
                        "This Is ",
                        speed: const Duration(milliseconds: 200),
                      ),
                      WavyAnimatedText(
                        "Wavy Animation",
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Hello !",
                        speed: const Duration(milliseconds: 300),
                      ),
                      TypewriterAnimatedText(
                        "This Is ",
                        speed: const Duration(milliseconds: 300),
                      ),
                      TypewriterAnimatedText(
                        "Type Writer Animation",
                        speed: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      FadeAnimatedText(
                        "Hello !",
                        duration: const Duration(milliseconds: 1000),
                      ),
                      FadeAnimatedText(
                        "I am ",
                        duration: const Duration(milliseconds: 1000),
                      ),
                      FadeAnimatedText(
                        "Fade Animation",
                        duration: const Duration(milliseconds: 1000),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      ScaleAnimatedText(
                        "Hello !",
                        duration: const Duration(milliseconds: 1000),
                      ),
                      ScaleAnimatedText(
                        "This Is",
                        duration: const Duration(milliseconds: 1000),
                      ),
                      ScaleAnimatedText(
                        "Scale Animation",
                        duration: const Duration(milliseconds: 1000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
