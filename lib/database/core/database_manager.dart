
import '../../main.dart';
import 'model.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static DatabaseManager? _instance;
  
  Database? mDatabase;
  String dbName='test.db';
  ConflictAlgorithm conflictAlgo = ConflictAlgorithm.replace;
  static DatabaseManager getInstance(){
    if(DatabaseManager._instance==null)
      DatabaseManager._instance=DatabaseManager._forDbName(DATABASE_NAME);
    return DatabaseManager._instance!;
  }
  DatabaseManager._forDbName(this.dbName);
  Future<DatabaseManager> init() async {
    this.mDatabase = await openDatabase(
        join(await getDatabasesPath(), this.dbName),
        onCreate: onDbCreate,
        version: 1);
    return Future.value(this);
  }

  onDbCreate(Database db, version) {
    String create_recipies_query = "CREATE table recipes("
        "name VARCHAR(100),"
        "description TEXT,"
        "imageUrl TEXT,"
        "id INTEGER  PRIMARY KEY NOT NULL"
        ");";

    print("query: $create_recipies_query");
    db
        .execute(create_recipies_query)
        .then((value) => {print("database create query executed!")});

  }

  Future<int> insert(Model model) async {
    Map<String,dynamic> mapData=model.toMap();
    mapData.remove("id");
    return this.mDatabase!.insert(model.tableName, mapData,
        conflictAlgorithm: this.conflictAlgo);
  }
  Future<int> update(Model model) async{

    return this.mDatabase!.update(model.tableName,model.toMap(),where:'id = ?',
        whereArgs: [model.id],
        conflictAlgorithm: this.conflictAlgo);
  }
  Future<int> delete(Model model) async{

    return this.mDatabase!.delete(model.tableName,where:'id = ?',
        whereArgs: [model.id]);
  }
  Future<List<Model>> selectAll(Model modelType) async{

    return this.mDatabase!.query(modelType.tableName).then((value) => List.of(value.map(modelType.fromMap)));
  }


}
