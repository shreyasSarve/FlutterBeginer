import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations_2/nextScreen.dart';

class DrawerWidget extends StatelessWidget {
  final ico;
  final title;
  DrawerWidget({this.ico, this.title});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple.shade800,
      shadowColor: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade700, shape: BoxShape.circle),
            child: Icon(ico, color: Colors.white),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.black,
            size: 30,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NextScreen(title)));
          },
        ),
      ),
    );
  }
}
