import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorCircle extends StatefulWidget {
  int red, blue, green;
  int radius;
  ColorCircle(this.red, this.blue, this.green,this.radius);
  @override
  ColorCircleState createState() => ColorCircleState();
}

class ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget().radius.toDouble(),
      height:widget().radius.toDouble(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(widget().red, widget().green, widget().blue, 1),
        border: Border.all(width: 3),
      ),
    );
  }
}
