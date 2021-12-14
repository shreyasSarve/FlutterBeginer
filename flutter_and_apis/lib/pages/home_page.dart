import 'package:flutter/material.dart';
import 'package:flutter_and_apis/customData/list.dart';
import 'package:flutter_and_apis/pages/click.dart';
import 'package:flutter_and_apis/widgets/list_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working With APIs"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.separated(
          itemBuilder: (_, index) => CustomListtile(myData[index],myData[index].id),
          separatorBuilder: (_, __) => const Divider(
                height: 8,
                color: Colors.blue,
              ),
          itemCount: myData.length),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(Colors.blue.shade900.red,
              Colors.blue.shade900.green, Colors.blue.shade900.blue, 1),
        ),
        height: 70,
        width: 70,
        child: IconButton(
          onPressed: _onFloatingActionPress,
          icon: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _onFloatingActionPress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Modify(0)));
  }
}
