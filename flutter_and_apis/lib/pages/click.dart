import 'package:flutter/material.dart';
import 'package:flutter_and_apis/model/add_node.dart';
import 'package:flutter_and_apis/model/api_handler.dart';

import 'package:flutter_and_apis/model/handler.dart';

class Modify extends StatelessWidget {
  Nodes? node;
  int modiifyState;
  final _nameController = TextEditingController();
  final _lastController = TextEditingController();
  Modify(this.modiifyState, {Key? key, this.node}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();

    _nameController.text = modiifyState == 1 ? node!.noteID : "";
    _lastController.text =
        modiifyState == 1 ? node!.createDateTime.toString() : "";
    return Scaffold(
      key:key,
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
                onPressed: () async {
                  InsertNode node = InsertNode(
                      noteTitle: _nameController.text,
                      noteContent: _lastController.text);
                  final result = await NodesServices().createNode(node);
                  if (result.data == false) {
                    key.currentState!.showSnackBar(
                      SnackBar(
                        content: Text("$result.errorMsg"),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    key.currentState!.showSnackBar(
                      const SnackBar(
                        content: Text("Success"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
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
