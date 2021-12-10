import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations_2/mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Drawer Navigation",
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 10,
          shadowColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: const Text(
            "Click Hanberger Option",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
