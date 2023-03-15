
import '../core/model.dart';

class OrderModel extends Model {
  String tableName = 'orders';
  String date;
  bool confirmed;
  int userId;

  OrderModel({id, required this.date, required this.confirmed, required this.userId}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'date': this.date, 'confirmed': this.confirmed?1:0, 'id': this.id,'userId':this.userId};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return OrderModel(userId:map['userId'] , date: map['date'],id:map['id'],confirmed: this.confirmed!=0);
  }

  @override
  String toString() {
    return 'OrderModel{tableName: $tableName, date: $date, confirmed: $confirmed, userId: $userId}';
  }
}
