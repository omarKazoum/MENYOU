
import 'package:on_time_dining_flutter/database/models/recipe_model.dart';
import 'package:on_time_dining_flutter/database/models/restaurant_model.dart';

import '../main.dart';
import '../database/core/model.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _instance;
  
  Database? mDatabase;
  String dbName='on_time_dining.db';

  ConflictAlgorithm conflictAlgo = ConflictAlgorithm.replace;
  static DatabaseService getInstance(){
    DatabaseService._instance ??= DatabaseService._forDbName(DATABASE_NAME);
    return DatabaseService._instance!;
  }
  DatabaseService._forDbName(this.dbName);
  Future<DatabaseService> init() async {
    mDatabase = await openDatabase(
        join(await getDatabasesPath(), dbName),
        onCreate: onDbCreate,
        version: 1);
    return Future.value(this);
  }

  onDbCreate(Database db, version) {
        createTables(db);
     }
  createTables( Database db){
    //create user table
    const String create_users_table="CREATE TABLE users(id INTEGER  PRIMARY KEY NOT NULL,userName VARCHAR(50),password VARCHAR(20));";
    //create user table
    const String create_orders_table="CREATE TABLE orders(id INTEGER  PRIMARY KEY NOT NULL,date VARCHAR(50),confirmed INTEGER DEFAULT 0,userId INTEGER,CONSTRAINT userId_fk  FOREIGN KEY (userId) REFERENCES users(id));";
    //create table restaurants
    const String create_restaurants_query = "CREATE table restaurants(title VARCHAR(100),description TEXT,imageUrl TEXT,id INTEGER  PRIMARY KEY NOT NULL);";
    //create table recipes
    const String create_recipies_query = "CREATE TABLE recipes(title VARCHAR(100),'price' REAL,'id' INTEGER  PRIMARY KEY NOT NULL,description TEXT,imageUrl TEXT,restaurantId INTEGER,CONSTRAINT restaurantId_fk  FOREIGN KEY (restaurantId) REFERENCES restaurants(id));";
    //create user table
    const String create_order_items_table="CREATE TABLE order_items(id INTEGER  PRIMARY KEY NOT NULL,orderId INTEGER,recipeId INTEGER,quantity INTEGER,CONSTRAINT orderId_fk  FOREIGN KEY (orderId) REFERENCES orders(id),CONSTRAINT recipeId_fk  FOREIGN KEY (recipeId) REFERENCES recipes(id));";
    final quries=[create_users_table,create_orders_table,create_restaurants_query,create_recipies_query,create_order_items_table];
    quries.forEach((element) async {
      await db.execute(element);
    });
    print('database tables created');
  }
  Future<int> insert(Model model) async {
    Map<String,dynamic> mapData=model.toMap();
    mapData.remove("id");
      //print("database is null${mDatabase==null}");
    return mDatabase!.insert(model.tableName, mapData,
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
  Future<List<Model>> selectAllWhere(Model modelType,{required String whereColName,required String whereColValue}) async{
    return this.mDatabase!.query(modelType.tableName,where: '$whereColName = ?',whereArgs: [whereColValue]).then((value) => List.of(value.map(modelType.fromMap)));
  }
  Future<List<Model>> selectAllWhereMultipleCondi(Model modelType,{required String whereCondition,required List<String> whereValues}) async{
    return this.mDatabase!.query(modelType.tableName,where: '$whereCondition',whereArgs: whereValues).then((value) => List.of(value.map(modelType.fromMap)));
  }
  Future<void> insertDummyData() async {
    //insert dummy restaurants
    for(int i=1;i<10;i++) {
      //insert restau
      await insert(RestaurantModel(id: i,title: "restaurant $i", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit, sint. $i", imageUrl: "https://picsum.photos/200/300?random=$i"));
      //insert recipes
      for(int r=1;r<5;r++) {
        await insert(RecipeModel(price: r*10,id:0, restaurantId: i, title: 'recipe $r', description: 'Lorem ipsum dolor sit amet.', imageUrl:  "https://picsum.photos/300?random=${i*r}"));
      }
    }

  }
  Future<int> deleteWhere(Model model,String whereCondition,List<String> whereArgs) {
    return this.mDatabase!.delete(model.tableName,where:whereCondition,
        whereArgs: whereArgs);
  }
  Future<List<Map<String,dynamic>>> query(String query){
    return this.mDatabase!.rawQuery(query);
  }
}
