import 'package:flutter/material.dart';
import 'package:stopwatch/circular_button.dart';
import 'build_time.dart';
import 'card_generator.dart';
import 'clock_painter.dart';
import 'helper.dart';
import 'lap.dart';
import 'main.dart';

class Potrait extends StatefulWidget {
   Potrait({Key? key}) : super(key: key);

  @override
  State<Potrait> createState() {
    return _PotraitState();
  }
}

int col = 0;


class _PotraitState extends State<Potrait> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTime(Ori.potrait),
        SizedBox(
          height: 400,
          width: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
              ),
              GestureDetector(
                onDoubleTap:pauseTimer,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CustomPaint(
                    painter: ClockPainter(playPauseColors[col]),
                  ),
                ),
              ),
              const Positioned(
                child: CircularButtton(Icons.add, addToSolvedProblems),
                bottom: 10,
                right: 10,
              ),
              const Positioned(
                child: CircularButtton(Icons.restore_outlined, resetTimer),
                left: 10,
                bottom: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 120,
          width: 380,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            itemCount: solvedProblems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardGenerator(index),
          ),
        ),
      ],
    );
  }

  pauseTimer() {
    setState(() {
      shouldChange = !shouldChange;
      if (shouldChange) {
        col = 0;
      } else {
        col = 1;
      }
    });
  }
}
