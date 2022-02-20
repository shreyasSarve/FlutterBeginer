import 'package:cping/model/contest_handler.dart';
import 'package:cping/ui/painters.dart';
import 'package:flutter/material.dart';

class ContestCard extends StatefulWidget {
  final ContestHandler contestHandler;
  const ContestCard(this.contestHandler, {Key? key}) : super(key: key);

  @override
  _ContestCardState createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  late ContestHandler _contestHandler;
  late String plateform;
  late String date;
  late String startTime;
  late String endTime;
  late String contestName;
  late String contestDiv;
  @override
  void initState() {
    super.initState();
    _contestHandler = widget.contestHandler;
    startTime = _contestHandler.startTime;
    plateform = _contestHandler.plateform;
    date = _contestHandler.date;
    endTime = _contestHandler.endTime;
    contestName = _contestHandler.contestName;
    contestDiv = _contestHandler.contestDiv;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            width: 300,
            height: 160,
            bottom: 10,
            right: 15,
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 10),
              child: Stack(children: [
                Positioned(
                  left: 10,
                  top: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startTime,
                              style: const TextStyle(
                                fontFamily: 'Consolas',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              endTime,
                              style: const TextStyle(
                                fontFamily: 'Consolas',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 160,
                        child: CustomPaint(
                          painter: LineCirclePainter(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              contestName,
                              style: const TextStyle(
                                  fontFamily: 'Constantia',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            Text(
                              contestDiv,
                              style: const TextStyle(
                                  fontFamily: 'Constantia',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: CustomPaint(painter: CirclePainter()),
                  right: 0,
                  top: 0,
                ),
              ]),
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),

          /*------------First Box------------------*/
          Positioned(
            left: 15,
            bottom: 10,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.computer,
                    color: Colors.amber,
                    size: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "C",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Copperplate',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "ODE",
                        style: TextStyle(
                          fontFamily: 'Copperplate',
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "FORCES",
                        style: TextStyle(
                          color: Color.fromRGBO(68, 95, 157, 1),
                          fontFamily: 'Copperplate',
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    date,
                    style: const TextStyle(
                        fontFamily: 'Copperplate',
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              width: 120,
              height: 160,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(184, 31, 36, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                boxShadow: [
                  // BoxShadow(spreadRadius: 0.2, blurRadius: 2),
                  //  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
