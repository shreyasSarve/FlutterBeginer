import 'package:flutter/cupertino.dart';

import 'color_changer.dart';
import 'colorCircle.dart';

class MyStateful extends StatefulWidget {
  var changeColor;
  MyStateful(this.changeColor);
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyStateful> {
  int _red = 0;
  int _blue = 0;
  int _green = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorCircle(_red, _blue, _green, 200),
          ColorChanger("Red", _red, _setState),
          ColorChanger("Blue", _blue, _setState),
          ColorChanger("Green", _green, _setState),
        ],
      ),
    );
  }

  void _setState(String property, int value) {
    setState(() {
      _red = (property == "Red") ? value : _red;
      _green = (property == "Green") ? value : _green;
      _blue = (property == "Blue") ? value : _blue;
      widget().changeColor(Color.fromRGBO(_red, _green, _blue, 1));
    });
  }
}
