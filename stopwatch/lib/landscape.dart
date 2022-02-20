import 'package:flutter/material.dart';
import 'package:stopwatch/circular_button.dart';
import 'package:stopwatch/potrait.dart';
import 'build_time.dart';
import 'card_generator.dart';
import 'clock_painter.dart';
import 'package:stopwatch/helper.dart';
import 'package:stopwatch/lap.dart';
import 'package:stopwatch/main.dart';

class Landscape extends StatefulWidget {
  

  @override
  State<Landscape> createState() {
    return _LandscapeState();
  }
}

class _LandscapeState extends State<Landscape> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: pauseTimer,
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 20),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: ClockPainter(playPauseColors[col]),
            ),
          ),
        ),
        SizedBox(
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircularButtton(Icons.add, addToSolvedProblems),
              CircularButtton(Icons.restore_outlined, resetTimer),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: buildTime(Ori.landScape),
                margin: const EdgeInsets.only(top: 20),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CardGenerator(index),
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: solvedProblems.length,
                ),
              ),
            ],
          ),
        )
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
