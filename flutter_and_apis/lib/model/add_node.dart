class InsertNode {
  String noteTitle;
  String noteContent;

  InsertNode({required this.noteContent, required this.noteTitle});

  Map<String, dynamic> toJson() {
    return {"noteTitle": noteTitle, "noteContent": noteContent};
  }
}
