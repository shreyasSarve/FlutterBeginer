import "package:flutter/material.dart";

class CircularNetworkImage extends StatelessWidget {
  const CircularNetworkImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Icon(
        Icons.person,
        size: 40,
        color: Colors.orange,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
    );
  }
}
