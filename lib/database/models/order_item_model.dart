
import '../core/model.dart';

class OrderItemModel extends Model {
  String tableName = 'order_items';
  int orderId;
  int recipeId;
  int quantity;

  OrderItemModel({id, required this.orderId,required this.recipeId,required this.quantity}):super(id);
  @override
  Map<String, dynamic> toMap() {
    return {'orderId': this.orderId, 'recipeId': this.recipeId, 'id': this.id,'quantity':this.quantity};
  }

  @override
  Model fromMap(Map<String,dynamic> map) {
    return OrderItemModel(quantity:map['quantity'] , orderId: map['orderId'],id:map['id'],recipeId:map['recipeId'] );
  }

  @override
  String toString() {
    return 'OrderModel{tableName: $tableName, orderId: $orderId, recipeId: $recipeId, quantity: $quantity}';
  }
}
