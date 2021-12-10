import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final Function() fun;
  final String label;
  final Color col;
  const Button({Key? key, required this.col, required this.fun,required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
    height:50,
    width: 200,
    margin: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: fun,
          child: Text(label,style: TextStyle(fontSize: 20),),
          style: ElevatedButton.styleFrom(
              primary: col, shape: const StadiumBorder(),onPrimary: Colors.black),
        ),
      );
}
