import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:styling_widgets/supermanShield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      title: "Styling Widgets",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Styling Widgets"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: 300.0,
                height: 300.0,
                child: const Text(
                  "Welcome back Shreyas!",
                  style: TextStyle(fontFamily: 'Samarkan', fontSize: 25),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  // borderRadius: const BorderRadius.only(
                  //   bottomRight: Radius.circular(10.0),
                  //   topRight: Radius.circular(20.0),
                  // ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.brown.shade900,
                        offset: Offset.fromDirection(0.0 * pi, 5.0),
                        blurRadius: 1.0),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                height: 200.0,
                width: 200.0,
                foregroundDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: CustomPaint(
                  size: const Size(200, 200),
                  painter: SupermanShield(),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    height: 300,
                    width: 300,
                    color: Colors.amber,
                  ),
                  Positioned(
                    top: 260,
                    left: 300,
                    child: Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
