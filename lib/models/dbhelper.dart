import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'item.dart';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;
  DBHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yang dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    // create, read database
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE item (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price INTEGER
        )
      ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

  //create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }
}
