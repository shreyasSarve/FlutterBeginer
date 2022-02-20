import 'package:cping/model/contest_handler.dart';
import 'package:cping/ui/card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ContestHandler _contestHandler = ContestHandler(
      plateform: "CODEFORCES",
      date: "25 JAN",
      startTime: "20:05",
      endTime: "22:05",
      contestName: "Codeforces Round #746",
      contestDiv: "Div.3");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(76, 8, 45, 1),
        appBar: AppBar(
          title: const Text("CPing"),
        ),
        body: ContestCard(_contestHandler),
      ),
    );
  }
}
