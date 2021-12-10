import 'package:color_picker/circle.dart';
import 'package:color_picker/slider.dart';
import 'package:flutter/widgets.dart';

class ColorChanger extends StatefulWidget {
  var floatingColor;
  Color col;
  ColorChanger(this.floatingColor, this.col, {Key? key}) : super(key: key);

  @override
  ColorChangerState createState() => ColorChangerState();
}

class ColorChangerState extends State<ColorChanger> {
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  final rKey = GlobalKey<SlidersState>();
  @override
  Widget build(BuildContext context) {
    _red = widget().col.red;
    _blue = widget().col.blue;
    _green = widget().col.green;
    return Container(
      child: Column(
        children: [
          Circle(_red, _green, _blue, 200),
          Sliders(_setState, _red, "Red", key: rKey),
          Sliders(_setState, _green, "Green"),
          Sliders(_setState, _blue, "Blue"),
          
        ],
      ),
    );
  }

  void _setState(String property, int val) {
    setState(() {
      _red = (property == "Red") ? val : _red;
      _green = (property == "Green") ? val : _green;
      _blue = (property == "Blue") ? val : _blue;
      widget().floatingColor(Color.fromRGBO(_red, _green, _blue, 1));
    });
  }
}
