import 'package:file_organization/model/storage_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritngTextData extends StatefulWidget {
  const WritngTextData({Key? key}) : super(key: key);

  @override
  _WritngTextDataState createState() => _WritngTextDataState();
}

class _WritngTextDataState extends State<WritngTextData> {
  final _myStorage = Storage();
  final _writingController = TextEditingController();
  final _readingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _writingController.addListener(() {
      setState(() {});
    });
    _readingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          child: const Text(
            "Reading Text File Data",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                enabled: true,
                controller: _writingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Write Data"),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: dataWritter,
                icon: Icon(
                  Icons.published_with_changes_outlined,
                  color: _writingController.text.isEmpty
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                enabled: false,
                controller: _readingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Retrived Data"),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: dataRetriever,
                icon: Icon(
                  Icons.replay_circle_filled,
                  color: _writingController.text.isNotEmpty
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  dataRetriever() {
    _myStorage.readingData().then((value) {
      setState(() {
        _readingController.text = value;
      });
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text("Data Retrieved"),
        duration: Duration(seconds: 1),
      ));
    });
  }

  dataWritter() {
    _myStorage.writingData(_writingController.text.toString()).then((value) {
      _writingController.text = "";
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text("Data Written"),
        duration: Duration(seconds: 1),
      ));
    });
  }
}
