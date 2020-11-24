import 'dart:async';
import 'dart:ffi';
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
        "CREATE TABLE lists(category TEXT, balance FLOAT, date TEXT, description TEXT, type TEXT);PRAGMA encoding = \'UTF-8\';",
      );
    },
    version: 1,
  );

  // CRUD Lists Class

  // insert
  Future<void> insertList(Lists list) async {
    final Database db = await database;

    await db.insert(
      'lists',
      list.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  /*
  วิธีการเพิ่ม สร้าง object 
  final list = Lists(
    'id': id,
      category: 'หมวดหมู่',
      balance: 'จำนวนเงิน',
      date: 'วันเดือนปี',
      description: 'รายละเอียด',
      type: 'ประเภท',
  );

  //เรียกใช้คำสั่ง
  await insertList(list);

  */

  // retrieve
  Future<List<Lists>> lists() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('lists');

    return List.generate(maps.length, (index) {
      return Lists(
          id: maps[index]['id'],
          category: maps[index]['category'],
          balance: maps[index]['balance'],
          date: maps[index]['date'],
          description: maps[index]['description'],
          type: maps[index]['type']);
    });
  }

/*

เรียกใช้คำสั่ง
  final list = await lists();

*/

  // update
  Future<void> updateLists(Lists list) async {
    final Database db = await database;

    await db.update(
      'lists',
      list.toMap(),
      where: "id = ?",
      whereArgs: [list.id],
    );
  }

/*

เรียกใช้คำสั่ง
await updateLists(
  Lists(
    'id': id,
      category: 'หมวดหมู่',
      balance: 'จำนวนเงิน',
      date: 'วันเดือนปี',
      description: 'รายละเอียด',
      type: 'ประเภท',
  )
);
*/
  // delete
  Future<void> deleteList(int id) async {
    final Database db = await database;

    await db.delete(
      'lists',
      where: "id = ?",
      whereArgs: [id],
    );
  }

/*

เรียกใช้คำสั่ง
  await deleteList(int id);

*/
}

class Lists {
  final int id;
  final String category;
  final Float balance;
  final String date;
  final String description;
  final String type;

  Lists(
      {this.id,
      this.category,
      this.balance,
      this.date,
      this.description,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'balance': balance,
      'date': date,
      'description': description,
      'type': type
    };
  }
}
