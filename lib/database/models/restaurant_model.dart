
import '../core/model.dart';

class RestaurantModel extends Model {
  String tableName = 'restaurants';
  String title;
  String description;
  String imageUrl;


  RestaurantModel({id, required this.title, required this.description,required this.imageUrl}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'title': this.title, 'imageUrl':imageUrl,'description': this.description, 'id': this.id};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return RestaurantModel(title:map['title'] ,imageUrl: map['imageUrl'], description: map['description'],id:map['id']);
  }

  @override
  String toString() {
    return 'RecipeModel{title: $title, description: $description,imageUrl: $imageUrl,id: ${super.id}}';
  }
}
