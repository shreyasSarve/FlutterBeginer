import 'package:flutter/material.dart';
import 'package:flutter_and_apis/model/add_node.dart';
import 'package:flutter_and_apis/model/api_handler.dart';

import 'package:flutter_and_apis/model/handler.dart';

// ignore: must_be_immutable
class Modify extends StatelessWidget {
  BackNode? backNode;
  int modiifyState;
  final _nameController = TextEditingController();
  final _lastController = TextEditingController();
  Modify(this.modiifyState, {Key? key, this.backNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();

    _nameController.text = modiifyState == 1 ? backNode!.frontNode.noteTitle : "";
    _lastController.text = modiifyState == 1 ? backNode!.noteContent : "";
    return Scaffold(
      key: key,
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
                  FocusScope.of(key.currentContext!).unfocus();

                  InsertNode newNode = InsertNode(
                      noteTitle: _nameController.text,
                      noteContent: _lastController.text);
                  // ignore: prefer_typing_uninitialized_variables
                  final result;
                  if (modiifyState == 0) {
                    result = await NodesServices().createNode(newNode);
                  } else {
                    result =
                        await NodesServices().modifyNode(newNode, backNode!.frontNode.noteID);
                  }

                  if (result.data == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$result.errorMsg"),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    // ignore: deprecated_member_use
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
