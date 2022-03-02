import 'package:flutter/material.dart';
import 'package:flutter_animations/routes/custom_pageroutes.dart';
import 'package:flutter_animations/screens/third_screen.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animationDownFromStart;
  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;
  late Animation<double> _elevationAnimation;
  late Animation<double> _textSizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ));
    _animationDownFromStart = Tween<double>(begin: 0.0, end: 0.7).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.ease),
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.4, curve: Curves.ease)));

    _elevationAnimation = Tween<double>(begin: 0, end: 3).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 0.8, curve: Curves.bounceIn)));
    _textSizeAnimation = Tween<double>(begin: 3, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.2, curve: Curves.ease)));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context)
            .pushReplacement(CustomPageRoute(child: const ThirdScreen())));
  }

  @override
  void dispose() {

    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: GestureDetector(
                onTap: (() => setState(() {
                      _animationController.reset();
                      _animationController.forward();
                    })),
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 200,
                  child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        elevation: _elevationAnimation.value,
                        child: const FlutterLogo(
                          size: 100,
                        ),
                      )),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.5 * _animationDownFromStart.value + 10,
            child: Text(
              "Flutter Animations",
              style: TextStyle(
                fontSize: 40 * _textSizeAnimation.value,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
