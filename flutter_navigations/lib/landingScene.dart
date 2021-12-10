import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/modifyMeScreen.dart';
import 'package:flutter_navigations/person.dart';
import 'package:flutter_navigations/registerMe.dart';

// ignore: must_be_immutable
class LandingScene extends StatelessWidget {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing Scene"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            readOnly: true,
            cursorColor: Colors.black,
            maxLength: 16,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: "Name",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
          TextField(
            readOnly: true,
            controller: passwordController,
            cursorColor: Colors.black,
            maxLength: 16,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              hintText: "Password",
              prefixIcon: Icon(
                Icons.password,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                navigateToRegisterMe(context);
              },
              child: Text(
                "Register YourSelf!",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                navigateToModifyMe(context);
              },
              child: Text(
                "Modify Your Details",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
            ),
          )
        ],
      ),
    );
  }

  navigateToRegisterMe(BuildContext context) async {
    Person? result = await Navigator.push<Person>(
        context, MaterialPageRoute(builder: (context) => RegisterMe()));

    print(result!.password);

    if (result.password.toString().isNotEmpty) {
      nameController.text = result.name;
      passwordController.text = result.password;
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result.toString()')));
    }
  }

  void navigateToModifyMe(BuildContext context) async {
    if (nameController.text.isEmpty && passwordController.text.isEmpty)
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Please Register first')));
    else {
      Map? result = await Navigator.push<Map>(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ModifyDetails(
                  name: nameController.text,
                  password: passwordController.text)));
      nameController.text = result!['name'];
      passwordController.text = result['password'];

    }
  }
}
