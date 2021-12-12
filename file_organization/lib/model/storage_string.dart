import 'dart:core';
import 'dart:io';


import 'package:path_provider/path_provider.dart';

class Storage {
  Future<String> get localDir async {
    final dir = await getApplicationDocumentsDirectory();         // for getting directory
    return dir.path;
  }

  Future<File> get localFile async {
    final file = await localDir;                     // for accesing local file where we gonna write data
    return File('$file/myFile.txt');
  }

  Future<File> writingData(String data) async {
    final file = await localFile;                       
    return file.writeAsString('$data');                 // writing Data into file
  }

  Future<String> readingData() async {
    try {
      final file = await localFile;
      String text = await file.readAsString();             //reading Data
      return text;
    } catch (e) {
      return "Error !";
    }
  }
}
