import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/person.dart';

class RegisterMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterMeState();
  }
}

class RegisterMeState extends State {
  MaterialColor nameColor = Colors.red;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var _myName;
  var _myPassword;
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Yourself!"),
        leading: IconButton(
          icon: Icon(Icons.leaderboard),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 5, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Name Here",
                  labelText: "Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: _nameController.text.isEmpty
                        ? Colors.black
                        : Colors.green,
                    size: 25,
                  ),
                  suffixIcon: _nameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            _nameController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red.shade600,
                          ),
                        ),
                ),
                validator: (val) {
                  if (val!.length < 4)
                    return "Lenght of Name > 4";
                  else
                    return null;
                },
                onSaved: (val) {
                  _myName = val!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: isPasswordVisible,
                controller: _passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Password Here",
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color: _passwordController.text.isEmpty
                        ? Colors.black
                        : Colors.green,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.black,
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () => setState(
                      () {
                        isPasswordVisible = !isPasswordVisible;
                      },
                    ),
                  ),
                ),
                validator: (val) {
                  if (val!.length < 8)
                    return "Lenght of Password > 8";
                  else
                    return null;
                },
                onSaved: (val) {
                  _myPassword = val!;
                },
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shadowColor: Colors.black87,
                    primary: Colors.white,
                    onPrimary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.transparent)),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  ),
                  label: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: validator,
                  icon: Container(
                    // padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.done,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validator() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      Person p=Person(name: _myName.toString(),password: _myPassword.toString());
      Map<String, String> mp = {
        'name': _myName.toString(),
        'password': _myPassword.toString()
      };
      Navigator.pop<Person>(context, p);
    }
  }
}
