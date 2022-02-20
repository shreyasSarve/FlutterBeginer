// import 'package:flutter/cupertino.dart';
import 'package:custom_drawer/icon.dart';
import 'package:flutter/material.dart';

class CustomDrawer2 extends StatefulWidget {
  const CustomDrawer2({Key? key}) : super(key: key);

  @override
  _CustomDrawer2State createState() => _CustomDrawer2State();
}

class _CustomDrawer2State extends State<CustomDrawer2> {
  String open = "Drag Slightly More to Open Drawer";
  String close = "Drag Slightly More to Close Drawer";
  bool isElevated = false;
  double xOffset = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.6;
    double width = MediaQuery.of(context).size.width * 0.2;
    return Center(
      widthFactor: 1,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 5.0 && !isElevated) {
            setState(
              () {
                isElevated = true;

                transLatePage(width);
              },
            );
          }

          if (details.delta.dx < -5.0 && isElevated) {
            setState(() {
              isElevated = false;
              transLatePage(0);
            });
          }
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: isElevated
                      ? [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ]
                      : null,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                ),
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularIcon("hackerRank"),
                    CircularIcon("hackerEarth"),
                    CircularIcon("atCoder"),
                    CircularIcon("codeCheff"),
                    CircularIcon("spoj"),
                    CircularIcon("codeForces"),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: const HomePage(),
              transform: Matrix4.translationValues(xOffset, 0, 0),
            ),
          ],
        ),
      ),
    );
  }

  transLatePage(double width) {
    setState(() {
      xOffset = width * 2;
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: [
          CustomCard(),
          Divider(height: 10, color: Colors.transparent),
          CustomCard(),
          Divider(height: 10, color: Colors.transparent),
          CustomCard(),
          Divider(height: 10, color: Colors.transparent),7
          CustomCard(),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);
  final Color ribbinColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ],
              ),
            ),
            Positioned(
              left: 30,
              child: Container(
                height: 200,
                width: 15,
                decoration: BoxDecoration(
                  color: ribbinColor,
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
