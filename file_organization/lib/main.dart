import 'package:file_organization/ui/writing_json.dart';
import 'package:file_organization/ui/writing_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("File Organization"),
            backgroundColor: Colors.green.shade900,
          ),
          body: ListView(
            children: const [
              WritngTextData(),
              WritingJSONData(),
            ],
          ),
        ),
      );
}
