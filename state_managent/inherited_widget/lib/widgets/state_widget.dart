import 'package:flutter/material.dart';
import 'package:gridview/model/core_state.dart';

class MyStateful extends StatefulWidget {
  final Widget child;
  const MyStateful({Key? key, required this.child}) : super(key: key);

  @override
  _MyStatefulState createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  CoreState coreState = CoreState();
  void incrementCounter() {
    final counter = coreState.counter;
    final newSate = CoreState(
        counter: counter + 1, backgroundColor: coreState.backgroundColor);
    setState(() {
      coreState = newSate;
    });
  }

  void updateCounter(int x) {
    final counter = coreState.counter;
    final newSate = CoreState(
        counter: counter + x, backgroundColor: coreState.backgroundColor);
    setState(() {
      coreState = newSate;
    });
  }

  void updateBackground(Color col) {
    final newSate = CoreState(backgroundColor: col, counter: coreState.counter);
    setState(() {
      coreState = newSate;
    });
  }

  @override
  Widget build(BuildContext context) => StateInherited(
        coreState: coreState,
        child: widget().child,
        stateWidget: this,
      );
}

class StateInherited extends InheritedWidget {
  CoreState coreState = CoreState();
  _MyStatefulState stateWidget;

  StateInherited(
      {required this.coreState,
      required Widget child,
      Key? key,
      required this.stateWidget})
      : super(key: key, child: child);

  static _MyStatefulState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StateInherited>()!.stateWidget;
  @override
  bool updateShouldNotify(StateInherited oldWidget) =>
      oldWidget.coreState != coreState;
}
