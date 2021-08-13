import 'package:flutter/material.dart';
import 'package:flutter_mtap/files/CounterStorage.dart';

class FilesDemo extends StatefulWidget {
  const FilesDemo({Key? key, required this.counterStorage}) : super(key: key);
  final CounterStorage counterStorage;

  @override
  _FilesDemoState createState() => _FilesDemoState();
}

class _FilesDemoState extends State<FilesDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.counterStorage
        .readCounter() //it might take some time to read the contents of the file
        .then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    widget.counterStorage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Files demo'),),
      body: Center(
        child: Text(' tapped $_counter times'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
