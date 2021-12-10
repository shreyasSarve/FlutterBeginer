import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () => simpleSnackBar(context),
                      child: Text("Simple SnackBar"),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          primary: Colors.deepPurple),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text("Action SnackBar"),
                      onPressed: () => actionSnackBar(context),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          primary: Colors.deepPurple),
                    ),
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text("Custom SnackBar"),
                      onPressed: () => customSnackBar(context),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          primary: Colors.deepPurple),
                    ),
                    margin: EdgeInsets.only(top: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  rowWithSpacerSizedBoxAndExpandable(),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Layouting Widgets"),
        ),
      ),
      title: "Layouting Widgets",
      theme: ThemeData(
        buttonColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
      ),
    );
  }

  void simpleSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar simpleSnack = SnackBar(content: Text("Simple Snack Bar"));
    ScaffoldMessenger.of(context).showSnackBar(simpleSnack);
  }

  actionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    SnackBar actionSnack = SnackBar(
      content: Text("Action Snack Bar"),
      action: SnackBarAction(
          label: "Dismiss",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    );
    ScaffoldMessenger.of(context).showSnackBar(actionSnack);
  }

  customSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar customSnack = SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.mail,
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              "   Custom SnackBar",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(customSnack);
  }

  rowWithSpacerSizedBoxAndExpandable() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Icon(
                Icons.person,
                color: Colors.red,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            child: Icon(
              Icons.person,
              color: Colors.red,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
    );
  }
}
