import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAlertDialog();
  }
}

class MyAlertDialog extends State<MyDialog> {
  var text = 'Show Dialog';
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _showMyDialog(context);
          },
          child: Text("Show Dialog"),
        ),
      Text(text) ],
    );
  }

  _showMyDialog(BuildContext context) async {
    var result = await showDialog<String>(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text("Material Dialog"),
        content: new Text("Hey! I'm Coflutter!"),
        actions: <Widget>[
          FlatButton(
            child: Text('Close me!'),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          )
        ],
      ),
    );
    if (result != null) {
      setState(() {
        text = result;
      });
    }
  }
}
