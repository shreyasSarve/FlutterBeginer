import 'package:flutter/widgets.dart';

class ContestHandler {
  final String plateform;
  final String date;
  final String startTime;
  final String endTime;
  final String contestName;
  final String contestDiv;

  ContestHandler(
      {required this.plateform,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.contestName,
      required this.contestDiv,});
}
