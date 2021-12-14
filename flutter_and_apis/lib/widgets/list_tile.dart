import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_apis/customData/list.dart';
import 'package:flutter_and_apis/model/handler.dart';
import 'package:flutter_and_apis/pages/click.dart';
import 'package:flutter_and_apis/widgets/tile_delete.dart';

class CustomListtile extends StatelessWidget {
  final Person person;
  final int index;
  const CustomListtile(this.person, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
      onDismissed: (direction) {
        if (myData.contains(person)) myData.remove(person);
      },
      confirmDismiss: (direction) async {
        final val = await showDialog(
            context: context, builder: (context) => const TileDelete());

        return val;
      },
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.lastName),
        leading: person.ico,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Modify(
                1,
                per: person,
              ),
            ),
          );
        },
      ),
    );
  }
}
