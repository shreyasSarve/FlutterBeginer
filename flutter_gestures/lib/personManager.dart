import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestures/person.dart';

// ignore: must_be_immutable
class PersonManager extends StatelessWidget {
  Person person;
  PersonManager(this.person);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      
      padding: EdgeInsets.fromLTRB(10, 0, 15,0),
      child: ListTile(
        shape: Border(
          bottom: BorderSide(width: 1, color: Colors.black),
        ),
        contentPadding: EdgeInsets.all(1),
        leading: Icon(Icons.person),
        title: Text(person.firstName),
        subtitle: Text(person.lastName),
        trailing: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}

