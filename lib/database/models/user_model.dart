
import '../core/model.dart';

class UserModel extends Model {
  String tableName = 'users';
  String userName;
  String password;

  UserModel({id, required this.userName, required this.password}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'userName': this.userName, 'password': this.password, 'id': this.id};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return UserModel(userName:map['userName'] , password: map['password'],id:map['id']);
  }

  @override
  String toString() {
    return 'RecipeModel{name: $userName, description: $password,id: ${super.id}}';
  }
}
