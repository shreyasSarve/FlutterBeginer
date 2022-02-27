import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _transtionAnimations;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _sizeAnimation = Tween<double>(
      begin: 5.0,
      end: 10.0,
    ).animate(_animationController);

    _opacityAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeIn)));
    _opacityAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.85, 1.0, curve: Curves.easeIn)));
    _transtionAnimations = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeIn)));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: (_transtionAnimations.value) * (width - 100),
            width: 100,
            height: 100,
            child: GestureDetector(
              onTap: (() => setState(() {
                    _animationController.forward();
                  })),
              child: Container(
                width: _sizeAnimation.value * 10,
                height: _sizeAnimation.value * 10,
                color: Colors.black,
                child: const FlutterLogo(),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: (() => setState(() {
                    _animationController.reset();
                    _animationController.forward();
                  })),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Opacity(
                    opacity: _opacityAnimation2.value,
                    child: const Text(
                      "Flutter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _opacityAnimation1.value,
                    child: const Text(
                      " Animations",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
