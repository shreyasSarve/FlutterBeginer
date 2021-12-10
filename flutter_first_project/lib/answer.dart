import 'dart:ffi';

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() pressingAction;
  final String answerOptions;
  Answer(this.answerOptions, this.pressingAction);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerOptions),
        onPressed: pressingAction,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.amber.shade900)),
      ),
    );
  }
}
