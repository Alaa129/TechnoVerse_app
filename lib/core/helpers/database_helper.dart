import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {  
  static final DatabaseHelper dbProvider = DatabaseHelper();
Database? database;


  Future<Database> get db async {
    if (database != null) return database!;

    database = await createDatabase();
    return database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "todo.db");

    var database = await openDatabase(path, version: 1, onCreate: createDB);
    debugPrint('___OPEN DATABASE____');
    return database;
  }

  void createDB(Database database, int version) async {
    await database.execute(
      'CREATE TABLE tasks (id INTEGER PRIMARY KEY,'
      ' title TEXT, date TEXT, startTime TEXT,'
      ' endTime TEXT,'
      ' reminder INTEGER,'
      ' color INTEGER)',
    );
    debugPrint('___create table ***********____');
  }
}
