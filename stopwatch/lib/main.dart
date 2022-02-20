import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/landscape.dart';
import 'package:stopwatch/potrait.dart';

enum Ori { potrait, landScape }
void main() {
  runApp(const MyApp());
}

int counter = 0;
int index = 1;
bool shouldChange = true;
Duration duration = const Duration();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 25),
      (timer) {
        setState(
          () {
            if (shouldChange) {
              counter++;
            }
            duration = Duration(milliseconds: counter * 25);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return   Center(child: Potrait());
          } else 
          {
            return  Center(child:  Landscape());
          }
        },
      ),
    );
  }
  
}
