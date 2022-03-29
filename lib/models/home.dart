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
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: Column(
        children: [
          Expanded(
            child: createListView(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Tambah Item'),
                onPressed: () async {
                  var item = await navigateToEntryForm(context, null);
                  if (item != null) {
                    // TODO 2 Panggil Fungsi untuk insert ke DB
                    int result = await dbHelper.insert(item);
                    if (result > 0) {
                      updateListView();
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.itemList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].price.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
            },
          ),
        );
      },
    );
  }
}
