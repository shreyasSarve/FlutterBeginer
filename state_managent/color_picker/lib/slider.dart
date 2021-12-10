import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  var property;
  var value;
  var onChanged;
  Sliders(this.onChanged, this.value, this.property, {Key? key})
      : super(key: key);
  @override
  SlidersState createState() => SlidersState();
}

class SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    var value = widget().value.toDouble();
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Slider(
              value: value,
              onChanged: _onChanged,
              label: widget().property.toString(),
              min: 0,
              max: 255,
              divisions: 256,
              activeColor: _setColor(widget().property),
              thumbColor: _setColor(widget().property),
            ),
          ),
          Container(
            width: 30,
            child: Text(
              widget().value.toString(),
              style: TextStyle(color: _setColor(widget().property)),
            ),
          ),
        ],
      ),
    );
  }

  _setColor(String prop) {
    if (prop == "Red") return Colors.red;
    if (prop == "Green") return Colors.green;
    if (prop == "Blue") return Colors.blue;
  }

  void _onChanged(double val) {
    setState(() {
      widget().value = val.round();
    });
    widget().onChanged(widget().property, widget().value);
  }
}
