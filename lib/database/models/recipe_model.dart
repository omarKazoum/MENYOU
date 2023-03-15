
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../core/model.dart';

class RecipeModel extends Model {
  String tableName = 'recipes';
  String title;
  String description;
  String imageUrl;
  double price;
  int restaurantId;

  RecipeModel({required this.price,required int id,required this.restaurantId, required this.title, required this.description,required this.imageUrl}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'price':this.price,'title': this.title, 'description': this.description, 'id': this.id,'imageUrl':this.imageUrl,'restaurantId':this.restaurantId};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return RecipeModel(price: map['price'],restaurantId:this.restaurantId,title:map['title'] , description: map['description'],id:map['id'],imageUrl:map['imageUrl'] );
  }

  @override
  String toString() {
    return 'RecipeModel{tableName: $tableName, title: $title, description: $description, imageUrl: $imageUrl, price: $price, restaurantId: $restaurantId}';
  }
}
