
import 'package:flutter/material.dart';

class TileDelete extends StatelessWidget {
  const TileDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Warning"),
      content: const Text("Are you sure You want to Delete"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("No"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("YES"))
      ],
    );
  }
}
