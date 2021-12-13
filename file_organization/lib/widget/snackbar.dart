import 'package:flutter/material.dart';

void showSnackBar(String msg, BuildContext context, {int dur = 1}) {
  // ignore: deprecated_member_use
  Scaffold.of(context).hideCurrentSnackBar();
  final snack = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: dur),
  );
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(snack);
}
