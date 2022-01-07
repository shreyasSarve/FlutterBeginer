class FrontNode {
  String noteID;

  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;
  FrontNode(this.noteID, this.noteTitle, this.createDateTime,
      this.latestEditDateTime);
}

class BackNode {
  String noteContent;
  FrontNode frontNode;
  BackNode(this.frontNode,this.noteContent);
}
