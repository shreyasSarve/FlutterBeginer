

import 'package:flutter/material.dart';

class CircularButtton extends StatelessWidget {
  final IconData iconData;
  final  VoidCallback callback;
  const CircularButtton(this.iconData, this.callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Icon(
        iconData,
        size: 40,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.shade400;
            }
          },
        ),
      ),
    );
  }
}
