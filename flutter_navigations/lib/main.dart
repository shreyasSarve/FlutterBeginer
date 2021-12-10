import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_navigations/landingScene.dart';
import 'package:flutter_navigations/registerMe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation",
      
      routes: {
        '/':(context)=>LandingScene(),
        '/registerMe':(context)=>RegisterMe(),
      },
      initialRoute: '/',
    );
  }
}
