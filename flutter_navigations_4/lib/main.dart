import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations_4/alertDialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static String? choice = 'Shreyash';
  static String? choise = '';
 
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final tabs = [
      MyDialog(),
      const Text(
        "Android",
        style: TextStyle(color: Colors.blue),
      ),
      const Text(
        "Search",
        style: TextStyle(color: Colors.green),
      ),
      const Text(
        "Camera",
        style: TextStyle(
          color: Color(0xff4b0082),
        ),
      )
    ];
    return MaterialApp(
      home: Scaffold(
        body: Center(child: tabs[currentIndex]),
        appBar: AppBar(
          title: Text('Bottom Navigation'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.star_border),
                backgroundColor: Colors.red,
                activeIcon: Icon(Icons.star)),
            BottomNavigationBarItem(
                label: 'Android',
                icon: Icon(Icons.android),
                backgroundColor: Colors.blue,
                activeIcon: Icon(Icons.android)),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search_outlined),
              backgroundColor: Colors.green,
              activeIcon: Icon(Icons.search_sharp),
            ),
            BottomNavigationBarItem(
                label: 'Camera',
                icon: Icon(Icons.camera_alt_outlined),
                backgroundColor: Colors.purple[900],
                activeIcon: Icon(Icons.camera_alt_sharp)),
          ],
        ),
      ),
    );
  }

  
}
