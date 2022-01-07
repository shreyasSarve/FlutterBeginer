import 'package:flutter/material.dart';
import 'package:flutter_and_apis/model/api_handler.dart';
import 'package:flutter_and_apis/model/handler.dart';
import 'package:flutter_and_apis/pages/click.dart';
import 'package:flutter_and_apis/widgets/tile_delete.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<FrontNode>? myData;
bool _isLoading = true;

class _MyHomePageState extends State<MyHomePage> {
  late ApiResponse<List<FrontNode>> _apiResponse;
  NodesServices services = NodesServices();
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // services.getResponce().then((data) => _apiResponse = data);
    _fetchData();
  }

  _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await services.getResponce();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Working With APIs"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Builder(
        builder: (context1) {
          if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green.shade900,
              ),
            );
          }
          if (_apiResponse.error) {
            return Container(
              color: Colors.red,
            );
          }
          return ListView.separated(
              itemBuilder: (_, index) => _apiResponse.error
                  ? Text(_apiResponse.errorMsg.toString())
                  : _buildListTile(_apiResponse.data[index], context1),
              separatorBuilder: (_, __) => const Divider(
                    height: 8,
                    color: Colors.blue,
                  ),
              itemCount: _apiResponse.data.length);
        },
      ),
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
    // globalKey.currentState!.hideCurrentSnackBar();
    ScaffoldMessenger.of(globalKey.currentContext!).hideCurrentSnackBar();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Modify(0)))
        .then((value) => _fetchData());
  }

  Widget _buildListTile(FrontNode node, BuildContext context1) {
    return Dismissible(
      key: ValueKey(node.noteID),
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
        if (_apiResponse.data.contains(node)) {
          setState(() {
            _apiResponse.data.remove(node);
          });
        }
      },
      confirmDismiss: (direction) async {
        final val = await showDialog(
            context: context, builder: (context1) => const TileDelete());

        return val;
      },
      child: ListTile(
        title: Text(node.noteTitle),
        subtitle: Text(node.createDateTime.toString()),
        onTap: () async {
          final content = await NodesServices().getNode(node.noteID);
          final backNode = BackNode(node, content.data);
          Navigator.of(context1)
              .push(
                MaterialPageRoute(
                  builder: (context) => Modify(
                    1,
                    backNode: backNode,
                  ),
                ),
              )
              .then(
                (value) => _fetchData(),
              );
        },
      ),
    );
  }
}
