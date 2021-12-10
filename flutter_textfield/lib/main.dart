import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

enum SearchType { anywhere, text, title }

class MyState extends State<MyApp> {
  var _searchTerm;
  Color? col = Colors.amber;
  SearchType? _searchType = SearchType.anywhere;
  bool? _isChecked = false;
  double _value = 0;
  TextEditingController _controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextFields"),
          backgroundColor: Colors.redAccent,
          elevation: 100,
        ),
        body: Column(
          children: [
            Checkbox(
                activeColor: Colors.lightBlue,
                value: _isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    _isChecked = val;
                  });
                }),
            TextField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hintText: "Input Here!",
                labelText: "Username",
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.red,
                  onPressed: () => _controller.clear(),
                )
                ,
              ),
              controller: _controller,
              onChanged: (String val) => _searchTerm = _controller.text,
            ),
            Radio<SearchType>(
                groupValue: _searchType,
                value: SearchType.anywhere,
                onChanged: (SearchType? val) {
                  setState(() {
                    _searchType = val;
                  });
                }),
            const Text("Search Anywhere"),
            Radio<SearchType>(
                activeColor: Colors.red,
                groupValue: _searchType,
                value: SearchType.text,
                onChanged: (SearchType? val) {
                  setState(() {
                    _searchType = val;
                  });
                }),
            const Text("Search Text"),
            Radio<SearchType>(
                activeColor: Colors.black,
                groupValue: _searchType,
                value: SearchType.title,
                onChanged: (SearchType? val) {
                  setState(() {
                    _searchType = val;
                  });
                }),
            const Text("Search Title"),
            Slider(
                value: _value,
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: col,
                onChangeStart: (double val) {
                  setState(() {
                    col = Colors.red;
                  });
                },
                onChangeEnd: (double val) {
                  setState(() {
                    col = Colors.amber;
                  });
                },
                inactiveColor: Colors.black,
                label: _value.toString(),
                onChanged: (double val) {
                  setState(() {
                    _value = val;
                  });
                }),
            DropdownButton<SearchType>(
                onChanged: (SearchType? val) {
                  setState(() {
                    _searchType = val;
                  });
                },
                value: _searchType,
                isExpanded: false,
                items: const <DropdownMenuItem<SearchType>>[
                  DropdownMenuItem<SearchType>(
                    child: Text('Anywhere'),
                    value: SearchType.anywhere,
                  ),
                  DropdownMenuItem<SearchType>(
                    child: Text('Text'),
                    value: SearchType.text,
                  ),
                  DropdownMenuItem<SearchType>(
                    child: Text('Title'),
                    value: SearchType.title,
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
