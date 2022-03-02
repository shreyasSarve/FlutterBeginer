import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/next_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _transtionAnimations;
  late AnimationController _animationController;
  bool flag = false;
  final col = Colors.black;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _transtionAnimations = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeIn)));

    _opacityAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeIn)));
    _opacityAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.85, 1.0, curve: Curves.easeIn)));
    _animationController.addListener(() {
      setState(() {
        if (_opacityAnimation2.isCompleted) {
          
        }
      });
    });

    _animationController.forward();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => const NextScreen())));
  }

  

  @override
  void dispose() {
    _animationController.dispose();
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
            child: Container(
              child: const FlutterLogo(),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Opacity(
                  opacity: _opacityAnimation2.value,
                  child: Text(
                    "Flutter",
                    style: TextStyle(
                      color: col,
                      fontSize: 40,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _opacityAnimation1.value,
                  child: Text(
                    " Animations",
                    style: TextStyle(
                      color: col,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
