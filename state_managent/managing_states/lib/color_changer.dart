import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ColorChanger extends StatefulWidget {
  var property;
  var _value;
  var onChanged;
  ColorChanger(this.property, this._value, this.onChanged);
  @override
  ColorChangerState createState() => ColorChangerState();
}

class ColorChangerState extends State<ColorChanger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Slider(
              value: widget()._value.toDouble(),
              onChanged: _onChanged,
              label: widget().property,
              thumbColor: _setMyColor(),
              activeColor: _setMyColor(),
              min: 0,
              divisions: 256,
              max: 255,
            ),
          ),
          Container(
            width: 30,
            child: Text(widget()._value.toString()),
          ),
        ],
      ),
    );
  }

  _setMyColor() {
    if (widget().property == "Red") return Colors.red;
    if (widget().property == "Blue") return Colors.blue;
    if (widget().property == "Green") return Colors.green;
  }

  _onChanged(double value) {
    setState(() {
      widget()._value = value.round();
    });
    widget().onChanged(widget().property, value.round());
  }
}
