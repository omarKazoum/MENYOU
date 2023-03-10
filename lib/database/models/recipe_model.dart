
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../core/model.dart';

class RecipeModel extends Model {
  String tableName = 'recipes';
  String name;
  String description;
  String imageUrl;

  RecipeModel({id, required this.name, required this.description,required this.imageUrl}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'name': this.name, 'description': this.description, 'id': this.id,'imageUrl':this.imageUrl};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return RecipeModel(name:map['name'] , description: map['description'],id:map['id'],imageUrl:map['imageUrl'] );
  }

  @override
  String toString() {
    return 'RecipeModel{name: $name, description: $description,id: ${super.id},imageUrl: $imageUrl}';
  }
}
