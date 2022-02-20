import 'package:flutter/cupertino.dart';
import 'helper.dart';
import 'main.dart';



Widget buildTime(Ori ori)
{
   final minutes = tDigits(duration.inMinutes.remainder(60), 2);
  final seconds = tDigits(duration.inSeconds.remainder(60), 2);
  final milliseconds = duration.inMilliseconds.remainder(1000).toString();
  late EdgeInsets margins;
  late EdgeInsets paddings;
  if(ori == Ori.potrait) 
  {
     margins=   EdgeInsets.only(top: 150);
    paddings = EdgeInsets.only(bottom: 20);
  } 
  else 
  {
    margins=   EdgeInsets.only(top:1);
    paddings = EdgeInsets.only(left: 20);
  }
return Container(
    margin: margins,
    padding: paddings,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: buildTimeComponents(minutes, 40),
          width: 50,
        ),
        SizedBox(child: buildTimeComponents(":", 40)),
        Container(
            child: buildTimeComponents(seconds, 80),
            margin: const EdgeInsets.symmetric(horizontal: 10)),
        SizedBox(child: buildTimeComponents(":", 40)),
        SizedBox(
          child: buildTimeComponents(milliseconds, 40),
          width: 90,
        ),
      ],
    ),
  );
}