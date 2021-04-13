import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  // TODO: store & fetch Top IDs
  Future<List<int>> fetchTopIds() {
    return null;
  }

  void init() async {
    print(
        '---------------  #1: news_db_provider - init() {path}  ---------------');
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, "xxx1.db");
    print(path);
    // /data/user/0/com.example.first_app/app_flutter/xxx1.db

    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) async {
      var batch = newDb.batch();

      batch.execute(
          'CREATE TABLE xxx (id INTEGER PRIMARY KEY, type TEXT, by TEXT, time INTEGER, text TEXT, parent INTEGER, kids BLOB, dead INTEGER, deleted INTEGER, url TEXT, score INTEGER, title TEXT, descendants INTEGER )');
      await batch.commit();
    });
  }

  Future<ItemModel> fetchItem(int id) async {
    var maps = await db.query(
      "xxx",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    print('---------------   #2: news_db_provider - fetchItem(int id) maps  ---------------');
    // print(maps);

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert(
      "xxx",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> clear() {
    return db.delete("xxx");
  }
}

// to avoid multiple connections with init()
final newsDbProvider = NewsDbProvider();
