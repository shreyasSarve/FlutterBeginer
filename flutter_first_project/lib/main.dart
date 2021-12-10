import 'package:flutter/material.dart';
import 'package:flutter_first_project/answer.dart';
import 'package:flutter_first_project/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List questions = [
    {
      "question": "What is Your Name?",
      "answers": ["Max", "Mimi", "Mamu", "Joel"]
    },
    {
      "question": "What is Your SurName?",
      "answers": ["Muel", "Mimix", "Mamul", "Joe"]
    },
    {
      "question": "What is Your Father's Name?",
      "answers": ["Max", "Mimi", "Mamu", "Joel"]
    }
  ];
  var _questionNo = 0;
  void _answerPressed() {
    setState(() {
      if (_questionNo < 2) _questionNo++;
      else _questionNo=0;
    });
  }

  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This Is Title Of My App"),
        ),
        body: Column(
          children: [
            
            Question(questions[_questionNo]["question"]),
            ...(questions[_questionNo]["answers"] as List<String>).map((answer){
              return Answer(answer,_answerPressed);
            }).toList(),ElevatedButton(onPressed: _answerPressed, child: Text("Click Me")),
          ],
        ),
      ),
    );
  }
}
