import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _password = "";
  String _username = "";
  var col = Colors.red;
  bool isPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {});
    });
    _usernameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print(_passwordController.text);
  }

  void pressed() {
    final isValid = formKey.currentState!.validate();
    if (isValid) formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
          backgroundColor: Colors.red,
        ),
        body: Form(
          key: formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                onSaved: (val) {
                  setState(() {
                    _username = val!;
                  });
                },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _usernameController,
                maxLength: 15,
                decoration: InputDecoration(
                  suffixIcon: _usernameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _usernameController.clear();
                          },
                        ),
                  border: OutlineInputBorder(),
                  hintText: "Username",
                  labelText: "Username",
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_rounded,
                    size: 40,
                    color:
                        _usernameController.text.isEmpty ? null : Colors.green,
                  ),
                ),
                validator: (val) {
                  if (val != null && val.length < 4)
                    return "Required > 4";
                  else
                    return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color:
                        _passwordController.text.isEmpty ? null : Colors.green,
                  ),
                  suffixIcon: IconButton(
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(
                            Icons.visibility,
                          ),
                    onPressed: () => setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    }),
                  ),
                ),
                onSaved: (val) => setState(() {
                  _password = val!;
                }),
                validator: (val) {
                  if (val!.length <= 4)
                    return "Required";
                  else
                    return null;
                },
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                autofocus: true,
                icon: (_passwordController.text.isNotEmpty &&
                        _passwordController.text.length > 4 &&
                        _usernameController.text.isNotEmpty)
                    ? Icon(
                        Icons.sports_esports_rounded,
                        color: Colors.black,
                        size: 30,
                      )
                    : Container(
                        width: 0,
                      ),
                onPressed: pressed,
                label: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              margin: EdgeInsets.all(10),
            ),
          ]),
        ),
      ),
    );
  }
}
