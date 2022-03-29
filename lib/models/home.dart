import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:kevin_jobsheet6sql/sqlite/dbhelper.dart';
import 'package:kevin_jobsheet6sql/sqlite/entryform.dart';

import 'item.dart';

class Home extends StatefulWidget {
  //pendukung program asinkron
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DBHelper dbHelper = DBHelper();
  int count = 0;

  List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Container();
  }
}
