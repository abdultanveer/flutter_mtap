import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // Add this line.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // Add this line.
    return  MaterialApp(
      title: 'welcome to flutter title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('appbar of app'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );

    //return app;
  }
}
