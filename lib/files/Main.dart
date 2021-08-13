import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'FilesDemo.dart';
import 'CounterStorage.dart';

void main(){
  runApp(MaterialApp(
    title: 'File storage',
    home: FilesDemo(counterStorage: CounterStorage()),
  ));
}

