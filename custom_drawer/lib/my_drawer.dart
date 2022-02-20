import 'package:custom_drawer/data.dart';
import 'package:custom_drawer/icon.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  final double height = 60;
  final double width = 60;
  final color = 0xff6d005e;

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: SizedBox(
        height: 600,
        width: 70,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(30)),
          child: Drawer(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularIcon("hackerRank"),
                  CircularIcon("hackerEarth"),
                  CircularIcon("codeCheff"),
                  CircularIcon("atCoder"),
                  CircularIcon("spoj"),
                  CircularIcon("codeForces"),
                ],
              ),
              width: 50,
              height: 50,
              color: drawerColor,
            ),
          ),
        ),
      ),
    );
  }
}

buildMenu(String title, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: Icon(
      icon,
      size: 40,
      color: Colors.white,
    ),
  );
}
