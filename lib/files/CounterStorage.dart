import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  Future<File> writeCounter(int contents) async {
    final file = await _localFile;
    return file.writeAsString('$contents');
  }

  void writeCounterSp(int contents) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', contents);
  }

  Future<int> readCounterSp() async {
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    final counter = prefs.getInt('counter') ?? 0;
    return counter;
  }
}
