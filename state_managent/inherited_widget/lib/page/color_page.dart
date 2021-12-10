import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/widgets/state_widget.dart';

class ColorPage extends StatelessWidget {
  ColorPage({Key? key}) : super(key: key);
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue.shade900,
    Colors.yellow.shade900
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("InheritedWidget"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createConatiner(colors[0], context),
            createConatiner(colors[1], context),
            createConatiner(colors[2], context),
            createConatiner(colors[3], context),
          ],
        ),
      ),
    );
  }

  Widget createConatiner(Color col, BuildContext context) => Container(
        height: 100,
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          onPressed: () {
            final provider = StateInherited.of(context);
            provider.updateBackground(col);
            Navigator.of(context).pop();
          },
          child: null,
          style: ElevatedButton.styleFrom(primary: col),
        ),
      );
}
