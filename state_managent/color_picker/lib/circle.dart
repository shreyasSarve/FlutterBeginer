// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Circle extends StatefulWidget {
  var r, b, g;
  var radii;
  Circle(this.r,this.g,this.b ,this.radii, {Key? key}) : super(key: key);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: widget().radii.toDouble(),
      height: widget().radii.toDouble(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3),
        color: Color.fromRGBO(widget().r, widget().g, widget().b, 1),
      ),
    );
  }
}
