import 'package:flutter/material.dart';

import 'myStateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Color _color = Colors.red;
  Map<Color, int> myFavoColors = {};
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Managing State"),
        ),
        body:
            MyStateful(changeColor),
         
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _color,
          ),
          width: 70,
          height: 70,
          child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.amber,
                size: 50,
              ),
              onPressed: addToFavorite),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  void addToFavorite() {
    //   if (!myFavoColors.containsKey(_color)) {
    //     counter++;
    //     myFavoColors[_color] = counter;
    //   }
    //   print(myFavoColors);
    // }
  }
}
