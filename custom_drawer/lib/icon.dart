import 'package:custom_drawer/data.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatefulWidget {
  String image;
  CircularIcon(this.image, {Key? key}) : super(key: key);

  @override
  State<CircularIcon> createState() => _CircularIconState();
}

class _CircularIconState extends State<CircularIcon> {
  final double height = 50;
  bool isElevated = false;
  final double width = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                boxShadow: isElevated
                    ? [
                        BoxShadow(
                            color: Colors.blueGrey.shade400,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1),
                         const BoxShadow(
                            color: Colors.white,
                            offset:  Offset(-2, -2),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]
                    : null,
                color: !isElevated
                    ? Colors.black.withOpacity(0.1)
                    : Colors.grey.shade500,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isElevated = !isElevated;
                });
              },
              child: ClipRRect(
                child: Image(
                  image: images[widget.image],
                  width: 50.0,
                  height: 50.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
