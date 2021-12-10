import 'dart:ui';

import 'package:flutter/material.dart';

class CoreState {
   int counter;
   Color backgroundColor;
  CoreState({this.counter = 0, this.backgroundColor = Colors.green});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CoreState &&
            runtimeType == other.runtimeType &&
            counter == other.counter &&
            backgroundColor == other.backgroundColor;
  }
}
