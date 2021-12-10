import 'package:flutter/material.dart';
import 'package:gridview/widgets/state_widget.dart';

import 'my_first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStateful(
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeData(primaryColor: Colors.white,
              scaffoldBackgroundColor:
                  StateInherited.of(context).coreState.backgroundColor),
          home: const MyFirstPage(),
        ),
      ),
    );
  }
}
