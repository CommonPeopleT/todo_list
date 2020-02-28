import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:todo_list/model/todo_item.dart';


/* SQLを操作するときに使う
 *
 *
 */
class SqlProvider{


  static const _dbName = "todo_list.db";
  static const _tableName = "todo_list";

  /* データベース
   * 処理が重そうだし、インスタンス毎に分ける必要性を感じなかったので、staticにした
   */
  static Future<Database> _database;

  SqlProvider(){
    _setupDatabase();
  }

  Future<void> _setupDatabase() async{
    if(_database != null)return _database;

    final dbPath = await getDatabasesPath();

    _database = openDatabase(path.join(dbPath,_dbName),
      onCreate: (db,version){
        return db.execute(
            "CREATE TABLE $_tableName("// テーブルの作成
              "id INTEGER PRIMARY KEY AUTOINCREMENT," // id (特に重要ではないのでAUTOINCREMENTにしておいた)
              "title TEXT,"                           // タイトル
              "detail TEXT"
            ")");                        // 詳細
      },
      version: 1,
    );
  }

  Future<void> insertItem(TodoItem todoItem) async{ // 新しく挿入する
    final db = await _database;
    db.insert(
        _tableName,
        todoItem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // 衝突したときは、新しいほうに置き換える
    );
  }

  Future<void> updateItem(TodoItem todoItem) async{ // アップデートする
    final db = await _database;
    db.update(_tableName,
      todoItem.toMap(),
      where: "id = ?",
      whereArgs: [todoItem.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<void> deleteItem({int id}) async { // idのitemを削除する
    final db = await _database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }


  Future<List<TodoItem>> fetchAllItems() async{
    final db = await _database;

    final mapList = await db?.query(_tableName); // todoItemのmapのリスト
    if(mapList == null)return []; // 安心したいのでnullだったらさっさと返す

    return List.generate(mapList.length,
      (i){
        return TodoItem.fromMap(
          id: mapList[i]['id'],
          title: mapList[i]['title'],
          detail: mapList[i]['detail']
        );
      }
    );
  }

}