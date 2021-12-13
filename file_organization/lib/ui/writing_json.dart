import 'dart:convert';

import 'package:file_organization/model/storage_string.dart';
import 'package:file_organization/widget/snackbar.dart';
import 'package:file_organization/widget/textformfield.dart';
import 'package:flutter/material.dart';

class WritingJSONData extends StatefulWidget {
  const WritingJSONData({Key? key}) : super(key: key);

  @override
  _WritingJSONDataState createState() => _WritingJSONDataState();
}

class _WritingJSONDataState extends State<WritingJSONData> {
  final _myStorage = Storage();
  final _idController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _occupationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idController.addListener(() {
      setState(() {});
    });
    _firstNameController.addListener(() {
      setState(() {});
    });
    _lastNameController.addListener(() {
      setState(() {});
    });
    _occupationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Working With JSON Data",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _clearData,
                  icon: Icon(
                    Icons.clear_all_outlined,
                    color: _clearColor(),
                    size: 30,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, elevation: 0),
                ),
                ElevatedButton.icon(
                  onPressed: _retrieveData,
                  icon: Icon(
                    Icons.replay_circle_filled,
                    color: _retrieveColor(),
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, elevation: 0),
                ),
                ElevatedButton.icon(
                  onPressed: _saveData,
                  icon: Icon(
                    Icons.save,
                    color: _saveColor(),
                    size: 30,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, elevation: 0),
                )
              ],
            ),
          ),
          InputMethod(
            _idController,
            label: "ID",
          ),
          const SizedBox(
            height: 20,
          ),
          InputMethod(_firstNameController, label: "FirstName"),
          const SizedBox(
            height: 20,
          ),
          InputMethod(_lastNameController, label: "LastName"),
          const SizedBox(
            height: 20,
          ),
          InputMethod(_occupationController, label: "Occupation"),
        ],
      ),
    );
  }

  Color _saveColor() {
    return _idController.text.isEmpty ||
            _lastNameController.text.isEmpty ||
            _firstNameController.text.isEmpty ||
            _occupationController.text.isEmpty
        ? Colors.red
        : Colors.green;
  }

  Color _clearColor() {
    return _idController.text.isNotEmpty ||
            _lastNameController.text.isNotEmpty ||
            _firstNameController.text.isNotEmpty ||
            _occupationController.text.isNotEmpty
        ? Colors.green
        : Colors.red;
  }

  Color _retrieveColor() {
    return _idController.text.isEmpty &&
            _firstNameController.text.isEmpty &&
            _lastNameController.text.isEmpty &&
            _occupationController.text.isEmpty
        ? Colors.green
        : Colors.red;
  }

  _saveData() {
    if (_idController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _occupationController.text.isEmpty) {
      showSnackBar("Please Fill All the Values to Save", context);
    } else {
      Map<String, dynamic> jsonMap = {
        "id": _idController.text.toString(),
        "firstName": _firstNameController.text.toString(),
        "lastName": _lastNameController.text.toString(),
        "occupation": _occupationController.text.toLowerCase(),
      };
      try {
        String jsonString = json.encode(jsonMap);
        _myStorage.writingData(jsonString).then((value) {
          showSnackBar("Json Written", context);
          _idController.clear();
          _firstNameController.clear();
          _lastNameController.clear();
          _occupationController.clear();
        });
      } catch (e) {
        showSnackBar("Error While Writing Data", context);
      }
    }
  }

  _clearData() {
    if (_clearColor() == Colors.red) {
      showSnackBar("NoData", context);
    } else {
      _idController.clear();
      _lastNameController.clear();
      _firstNameController.clear();
      _occupationController.clear();
    }
  }

  _retrieveData() {
    _myStorage.readingData().then((value) {
      Map<String, dynamic> personMap = jsonDecode(value);
      _idController.text = personMap["id"];
      _firstNameController.text = personMap["firstName"];
      _lastNameController.text = personMap["lastName"];
      _occupationController.text = personMap["occupation"];
    });
  }
}
