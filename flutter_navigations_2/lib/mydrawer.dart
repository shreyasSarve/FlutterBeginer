import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations_2/drawerWidgets.dart';
import 'package:flutter_navigations_2/nextScreen.dart';

class MyDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.deepPurple.shade800),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              margin: EdgeInsets.only(top: 0),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(color: Colors.deepPurple.shade800),
              child: Container(
                height: 90,
                width: 90,
                child: Icon(
                  Icons.access_alarm,
                  size: 60,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade700,
                  shape: BoxShape.circle,
                ),
              ),
              height: 200,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  fillColor: Colors.white12,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.7))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.7))),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            DrawerWidget(
              ico: Icons.star,
              title: "Star Widget",
            ),
            DrawerWidget(
              ico: Icons.people,
              title: "People Widget",
            )
          ],
        ),
      ),
    );
  }
}
