import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/page/color_page.dart';
import 'package:gridview/widgets/button.dart';
import 'package:gridview/widgets/state_widget.dart';

import 'my_second_page.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    final int counter = StateInherited.of(context).coreState.counter;
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter',style: TextStyle(fontSize: 70),),
              Button(fun: changeColor,col: Colors.white,label: "Change Color",),
              Button(fun: changeCounter,col:Colors.white,label: "Changer Counter",)
          ],
        ),
      ),
    );
  }

  

   changeColor() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ColorPage()));
  }
     
  changeCounter() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  MySecondPage()));
  }
}
