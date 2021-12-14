

import 'package:flutter/material.dart';
import 'package:flutter_and_apis/customData/list.dart';
import 'package:flutter_and_apis/model/handler.dart';

class Modify extends StatelessWidget {
  Person? per;
  int modiifyState;
  final _nameController = TextEditingController();
  final _lastController = TextEditingController();
  Modify(this.modiifyState, {Key? key, this.per}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = modiifyState == 1 ? per!.name : "";
    _lastController.text = modiifyState == 1 ? per!.lastName : "";
    return Scaffold(
      appBar: AppBar(
        title: Text(modiifyState == 1 ? "Modify" : "Create New"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("LastName")),
              controller: _lastController,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (modiifyState == 0) {
                    myData.add(
                        Person(myData.length+1,_lastController.text, _nameController.text));
                    print(_lastController.text);
                    
                    print(myData);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(primary: Colors.blue.shade900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
