import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'Dog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'dogdb'),
      version: 1,
      onCreate: (db, version) {
    String sql =
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)';
    db.execute(sql);
  });

  //CRUD
  Future<void> insertDog(Dog dog) async {
    final db = await database;
    int position = await db.insert('dogs', dog.toMap(),
        nullColumnHack: null, conflictAlgorithm: ConflictAlgorithm.replace);
    print('inserted dog');
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;
    List<Map<String, dynamic>> mapRows = await db.query('dogs');
    return List.generate(mapRows.length, (position) {
      var dog = Dog(
          id: mapRows[position]['id'],
          name: mapRows[position]['name'],
          age: mapRows[position]['age']);
      print(dog.toString());
      return dog;

    });
  }

  Future<int> updateDog(Dog dog) async {
    final db = await database;
    int rowPostion = await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
    return rowPostion;
  }

  void deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs',
    where: 'id = ?',
    whereArgs: [id]);
  }

  var pomerian = Dog(
    id: 1, name: 'dauberman', age: 1
  );

  await insertDog(pomerian);
  await getDogs();

}


