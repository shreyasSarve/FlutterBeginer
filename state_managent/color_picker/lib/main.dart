import 'package:color_picker/color_changer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  final gKey = GlobalKey<ColorChangerState>();
  @override
  MyAppState createState() => MyAppState();
}

List<Color> myColors = [];

class MyAppState extends State<MyApp> {
  Color _color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Color Picker"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColorChanger(
              _floatingColor,
              _color,
              key: widget().gKey,
            ),
            Container(
              child: const Text(
                "Favorite Colors",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              height: 30,
              alignment: Alignment.topLeft,
            ),
            Expanded(child: _gridView()),
          ],
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.circle,
            border: Border.all(width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.amber, size: 50),
            onPressed: _onPressed,
          ),
        ),
      ),
    );
  }

  _floatingColor(Color col) {
    setState(() {
      _color = col;
    });
  }

  _onPressed() {
    if (!isExist(_color)) {
      setState(() {
        myColors.add(_color);
      });
    }
  }

  bool isExist(Color col) {
    bool exist = false;
    for (Color a in myColors) {
      if (a == col) {
        exist = true;
        break;
      }
    }
    return exist;
  }

  Widget containerBuilder(Color col) {
    return Container(
      decoration: BoxDecoration(color: col, shape: BoxShape.circle),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _color = col;
          });
        },
        child: null,
        style:
            ElevatedButton.styleFrom(primary: col, shape: const CircleBorder()),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      itemCount: myColors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, crossAxisSpacing: 2.5, mainAxisSpacing: 3),
      itemBuilder: (context, index) {
        return containerBuilder(myColors[index]);
      },
      padding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
