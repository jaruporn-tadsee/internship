import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'istatement.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE list(catagory TEXT, balance DOUBLE, date TEXT, description TEXT, type TEXT);PRAGMA encoding = \'UTF-8\';",
      );
    },
    version: 1,
  );
}
