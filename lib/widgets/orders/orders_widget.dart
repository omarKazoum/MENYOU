
import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/models/order_model.dart';
import 'package:on_time_dining_flutter/widgets/orders/order_item.dart';
import '../../main.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({Key? key}) : super(key: key);

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  bool isLoading=true;
  List<Map<String,dynamic>> orders=[];

  @override
  Widget build(BuildContext context) {
    if(isLoading)
      loadConfirmedOrders();
    return isLoading?Center(child: Container(width: 100,height: 100,child: CircularProgressIndicator()),):ListView.builder(itemCount: orders.length,itemBuilder: (context, index) =>OrderItemWidget(orderMap: orders[index]));
  }

  Future<void> loadConfirmedOrders() async {
    databaseService.query("select o.id,o.date,rs.title as restaurant_title,sum(r.price*oi.quantity) as amount from orders o INNER JOIN order_items oi ON oi.orderId=o.id INNER JOIN recipes r ON oi.recipeId=r.id INNER JOIN restaurants rs ON rs.id=r.restaurantId where o.confirmed!=0 group by o.id;").
    then((value){
      setState(() {
        this.orders= List.from(value.map((e) => e));
        isLoading=false;
      });
    });

  }
}
