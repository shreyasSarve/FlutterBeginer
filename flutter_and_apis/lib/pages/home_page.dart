import 'package:flutter/material.dart';
import 'package:flutter_and_apis/customData/list.dart';
import 'package:flutter_and_apis/model/handler.dart';
import 'package:flutter_and_apis/pages/click.dart';
import 'package:flutter_and_apis/widgets/tile_delete.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
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
          itemBuilder: (_, index) => _buildListTile(myData[index]),
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

  Widget _buildListTile(Person person) {
    return Dismissible(
      key: ValueKey(person.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
      onDismissed: (direction) {
        if (myData.contains(person)) {
          setState(() {
            myData.remove(person);
          });
        }
      },
      confirmDismiss: (direction) async {
        final val = await showDialog(
            context: context, builder: (context) => const TileDelete());

        return val;
      },
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.lastName),
        leading: person.ico,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Modify(
                1,
                per: person,
              ),
            ),
          );
        },
      ),
    );
  }
}
