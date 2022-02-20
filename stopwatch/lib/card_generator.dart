import 'package:flutter/material.dart';
import 'package:stopwatch/helper.dart';
import 'package:stopwatch/lap.dart';

class CardGenerator extends StatelessWidget {
  final int index;
  const CardGenerator(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Duration diffDuration;
    if (solvedProblems[index].index == 1) {
      diffDuration = solvedProblems[index].time;
    } else {
      diffDuration =
          solvedProblems[index].time - solvedProblems[index+1].time;
    }

    final completionSeconds =
        tDigits( solvedProblems[index].time.inSeconds.remainder(60),2);
    final completionMinutes =
        tDigits( solvedProblems[index].time.inMinutes.remainder(60),2);
    final completionMilliseconds =
        tDigits( solvedProblems[index].time.inMilliseconds.remainder(1000),2);

    final differenceSeconds =
        tDigits(diffDuration.inSeconds.remainder(60),2);
    final differenceMinutes =
        tDigits(diffDuration.inMinutes.remainder(60),2);
    final differenceMilliSeconds =
        tDigits(diffDuration.inMilliseconds.remainder(1000),2);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              tDigits(solvedProblems[index].index,2),
              style: TextStyle(
                color: Colors.blueGrey[400],
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.blueGrey.shade800,
                    offset: const Offset(-3, -3),
                    blurRadius: 11,
                  ),
                  Shadow(
                    color: Colors.blueGrey.shade200,
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "$completionMinutes:",
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$completionSeconds:",
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      completionMilliseconds,
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "$differenceMinutes:",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$differenceSeconds:",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      differenceMilliSeconds,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey[400],
        ),
        width: 350,
        height: 100,
      ),
    );
  }
}
