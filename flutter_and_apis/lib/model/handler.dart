import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  String name;
  String lastName;
  Icon ico = const Icon(Icons.person);

  Person(this.lastName, this.name, [this.ico = const Icon(Icons.person)]);
  
}
