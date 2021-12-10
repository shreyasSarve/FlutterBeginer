import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/widgets/button.dart';
import 'package:gridview/widgets/state_widget.dart';
class MySecondPage extends StatefulWidget {
  const MySecondPage({ Key? key }) : super(key: key);

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(col: Colors.white, fun: updater, label: "Updater"),
            Button(col: Colors.white, fun: increementor, label: "Incrementor"),
          ],
        ),
      ),
    );
  }

  increementor() {
    final provider = StateInherited.of(context);
    provider.incrementCounter();
    Navigator.pop(context);
  }

  updater() {
    final provider = StateInherited.of(context);
    provider.updateCounter(10);
    Navigator.pop(context);
  }
}

