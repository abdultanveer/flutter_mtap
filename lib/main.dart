import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'my first app',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
            fontFamily: 'IndieFlower',
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
          body: Center(
              child: Text('welcome to moneytap')
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: Text('click me'),
            onPressed: () {  },

          ),
    )));
