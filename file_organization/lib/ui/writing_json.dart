import 'package:file_organization/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WritingJSONData extends StatefulWidget {
  const WritingJSONData({Key? key}) : super(key: key);

  @override
  _WritingJSONDataState createState() => _WritingJSONDataState();
}

class _WritingJSONDataState extends State<WritingJSONData> {
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
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Working With JSON Data",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _onPressed,
                  icon: Icon(
                    Icons.save,
                    color: saveColor(),
                    size: 40,
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

  Color saveColor() {
    return _idController.text.isEmpty ||
            _lastNameController.text.isEmpty ||
            _firstNameController.text.isEmpty ||
            _occupationController.text.isEmpty
        ? Colors.red
        : Colors.green;
  }

  _onPressed() {
    if (_idController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _occupationController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
         const  SnackBar(content: Text("Please Fill All the Values to Save")));
    }
  }
}
