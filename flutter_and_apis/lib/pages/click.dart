import 'package:flutter/material.dart';
import 'package:flutter_and_apis/model/handler.dart';

class Modify extends StatelessWidget {
  Person? per;
  int modiifyState;

  Modify(this.modiifyState, {Key? key, this.per}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              controller: TextEditingController(
                  text: modiifyState == 1 ? per!.name : ""),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("LastName")),
              controller: TextEditingController(
                  text: modiifyState == 1 ? per!.lastName : ""),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  
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
