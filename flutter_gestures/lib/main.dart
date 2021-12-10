import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestures/person.dart';
import 'package:flutter_gestures/personManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyApp> {
  List<Person> _peopleObject = [
    Person("Shankar", "Sarve"),
    Person("Gita", "Sarve"),
    Person("Shreyas", "Sarve"),
    Person("Shruti", "Sarve")
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Gestures"),
        ),
        body: ListView(
          children: _peopleObject.map(
            (person) {
              double _swipeStartX = 0;
              String _swipeDirection = "";
              return GestureDetector(
                child: PersonManager(person),
                onHorizontalDragStart: (e) {
                  _swipeStartX = e.globalPosition.dx;
                },
                onHorizontalDragUpdate: (e) {
                  if ((e.globalPosition.dx > _swipeStartX)) {
                    _swipeDirection = "Right";
                  } else {
                    _swipeDirection = "Left";
                  }
                },
                onHorizontalDragEnd: (e) {
                  if (_swipeDirection == "Right") {
                    setState(() {
                      _peopleObject.remove(person);
                    });
                  }
                },
                onLongPress: () {
                  print("Deleting ${person.firstName}");
                  setState(() {
                    _peopleObject.remove(person);
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
