import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputMethod extends StatelessWidget {
  final _controller;
  final label;
   InputMethod(  this._controller,{required this.label,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      TextFormField(
        enabled: true,
        controller: _controller,
        decoration:  InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ;
  }
}
