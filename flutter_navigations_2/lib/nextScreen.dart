import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final widgetNo;
  NextScreen(this.widgetNo);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("On Widget  $widgetNo "),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Click To Back --> "),
          )
        ],
      )),
    );
  }
}
