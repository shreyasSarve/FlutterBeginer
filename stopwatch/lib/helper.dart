
import 'package:flutter/material.dart';
import 'package:stopwatch/lap.dart';
import 'package:stopwatch/main.dart';

Widget buildTimeComponents(String component, double size) {
  return Text(
    component,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),
  );
}

addToSolvedProblems() {
  solvedProblems.insert(0, Solved(index: index, time: duration));

  index++;
}

String tDigits(int n, int t) => n.toString().padLeft(t, '0');

resetTimer() {
  counter = 0;
}


List<Color> playPauseColors = [Colors.grey.shade100, Colors.green];
