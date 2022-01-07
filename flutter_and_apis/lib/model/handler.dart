

import 'package:flutter/material.dart';


class Nodes {
  String noteID;

  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;
  Nodes(this.noteID, this.noteTitle, this.createDateTime,
      this.latestEditDateTime);
}
