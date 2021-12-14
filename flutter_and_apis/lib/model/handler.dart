import 'package:flutter/material.dart';

class Person {
  int id;
  String name;
  String lastName;
  Icon ico = const Icon(Icons.person);

  Person(this.id, this.lastName, this.name,
      [this.ico = const Icon(Icons.person)]);
}
