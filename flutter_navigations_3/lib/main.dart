import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            // color: Colors.amber,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepOrange.shade900,
                Colors.white,
                Colors.green.shade900
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Tab Navigation",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue[900]),
          ),
          bottom: TabBar(
            onTap: (index) {
              print(index);
            },
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorPadding: EdgeInsets.only(top: 0, bottom: 0),
            tabs: [
              Tab(
                icon: Icon(Icons.star),
                child: const Text("Star"),
              ),
              Tab(
                icon: Icon(Icons.person),
                child: const Text("Person"),
              ),
              Tab(
                icon: Icon(Icons.people),
                child: const Text("People"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [widgetOne(), widgetTwo(), widgetThree()],
        ),
      ),
    ));
  }

  widgetTwo() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.amber),
    );
  }

  widgetOne() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.yellow.shade700),
    );
  }
}

widgetThree() {
  return Container(
    height: double.infinity,
    decoration: BoxDecoration(color: Colors.yellow[500]),
  );
}
