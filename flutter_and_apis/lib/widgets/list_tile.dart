import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_apis/model/handler.dart';

class CustomListtile extends StatelessWidget {
  final Person person;
  const CustomListtile(this.person,{Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.lastName),
        leading: person.ico,
      ),
    );
  }
}
