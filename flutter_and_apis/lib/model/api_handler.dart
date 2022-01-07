// import 'dart:html';

import 'package:flutter_and_apis/model/add_node.dart';
import 'package:flutter_and_apis/model/handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiResponse<T> {
  T data;
  bool error;
  String errorMsg;
  ApiResponse(
      {required this.data,
      this.error = false,
      this.errorMsg = "Some Error occuted"});
}

class NodesServices {
  static const url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/';
  static final header = {
    'apiKey': '2539442c-336f-41d7-95e8-a7dec997104a',
    'Content-Type': 'application/json'
  };
  Future<ApiResponse<List<Nodes>>> getResponce() {
    return http.get(Uri.parse(url + '/notes'), headers: header).then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.body);
        final jsonData = json.decode(data.body);
        final nodes = <Nodes>[];
        for (var item in jsonData) {
          nodes.add(
            Nodes(
              item['noteID'],
              item['noteTitle'],
              DateTime.parse(item['createDateTime']),
              DateTime.parse(item['createDateTime']),
            ),
          );
        }
        return ApiResponse<List<Nodes>>(data: nodes, error: false);
      } else {
        return ApiResponse<List<Nodes>>(
            data: [], error: true, errorMsg: "Some Error Occured");
      }
      // ignore: argument_type_not_assignable_to_error_handler
    });
  }

  ApiResponse<String> onError() {
    return ApiResponse<String>(
        data: " ", error: true, errorMsg: "Something Went wrong");
  }

  Future<ApiResponse<String>> getNode() {
    return http
        .get(Uri.parse(url + '/notes/BJLyLwNFiANH9F7VVupn'), headers: header)
        .then(
      (value) {
        if (value.statusCode == 200) {
          print(value.body);
          final jsonData = json.decode(value.body);
          return ApiResponse<String>(data: jsonData['noteContent']);
        } else {
          return ApiResponse<String>(
              data: " ", error: true, errorMsg: "Somthing Went wrong !");
        }
      },
    );
  }

  Future<ApiResponse<bool>> createNode(InsertNode node) {
    return http
        .post(Uri.parse(url+'/notes'), headers: header, body: json.encode(node.toJson()))
        .then(
      (val) {
        if (val.statusCode == 201) //Status code here is 201 not 200
        {
          return ApiResponse<bool>(data: true);
        } else {
          return ApiResponse<bool>(
              data: false,
              error: true,
              errorMsg: "Something Wrong Happened ! ");
        }
      },
    );
  }
}
