import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  //path to the directory
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//file created in the directory
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      print(e);
    }
    return 0;
  }

  Future<File> writeCounter(int contents) async{
    final file = await _localFile;
    return file.writeAsString('$contents');
  }
}
