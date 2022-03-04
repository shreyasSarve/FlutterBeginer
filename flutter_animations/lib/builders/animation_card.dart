import 'package:flutter/material.dart';
import 'package:flutter_animations/model/animation.dart';

class AnimationCard extends StatelessWidget {
  final Anim anim;
  const AnimationCard(this.anim, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anim.title),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_right_alt,
          color: Colors.red,
          size: 40,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => anim.widget));
        },
      ),
    );
  }
}
