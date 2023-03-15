import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/core/model.dart';
import 'package:on_time_dining_flutter/database/models/order_item_model.dart';
import 'package:on_time_dining_flutter/database/models/recipe_model.dart';
import 'package:on_time_dining_flutter/main.dart';
import 'package:intl/intl.dart';
import 'package:on_time_dining_flutter/services/notifications_service.dart';

import '../database/models/order_model.dart';

Future<void> addRecipeToCart(int recipeId)async {
  //let 's get the id of the not confirmed order
  int cartOrderId=await _getCartOrderId();

  // let's check if the item with that recipe id and order id exists
  List<Model> orderItems=await databaseService.selectAllWhereMultipleCondi(OrderItemModel(orderId: 0, recipeId: 0, quantity: 0)
      , whereCondition: 'orderId= ? AND recipeId= ?', whereValues: [cartOrderId.toString(),recipeId.toString()]);
  if(orderItems.isEmpty)
    {
      // an item id for the order and recipe does not already exist let's create it
      await databaseService.insert(OrderItemModel(orderId: cartOrderId, recipeId: recipeId, quantity: 1));
    }
  else{
    // increment the quantity
    OrderItemModel orderItemModel=orderItems.first as OrderItemModel;
    orderItemModel.quantity++;
    databaseService.update(orderItemModel);
  }
}
emptyCart() async {
  int cartOrderId=await _getCartOrderId();
  await databaseService.deleteWhere(OrderItemModel(orderId: 0, recipeId: 0, quantity: 0),'orderId=?',[cartOrderId.toString()]);
}
Future<int> _getCartOrderId() async {
  int cartOrderId=0;
  List<Model> results=await databaseService.selectAllWhere(OrderModel(confirmed: false,userId: 1, date: ''), whereColName: 'confirmed', whereColValue: 0.toString());
  if(results.isEmpty) {

    return await databaseService.insert(
        OrderModel(userId: 1,confirmed: false,date: _getNowFormatedDate(),id: 0));
  }else{
    return (results.first as OrderModel).id! ;
  }
}
Future<List<Map<String, dynamic>>> getCart() async {
  return await databaseService.query("select o.id,r.title,oi.quantity,r.price*oi.quantity as order_item_price,r.price from orders o INNER JOIN order_items oi ON oi.orderId=o.id INNER JOIN recipes r on oi.recipeId=r.id where o.confirmed==0; ");
}
Future<Map<String,dynamic>> _getRecipeById(int recipeId) async {
  return (await databaseService.selectAllWhere(RecipeModel(price: 0, id: 0, restaurantId: 0, title: '', description: '', imageUrl: ''), whereColName: 'id', whereColValue: recipeId.toString())).first.toMap();
}
showSnackBar({required BuildContext context,required String text}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
      Text(text)));
}
confirmOrder() async {
  OrderModel cartOrder=(await databaseService.selectAllWhere(OrderModel(date: '', confirmed: false, userId: 0), whereColName: 'confirmed', whereColValue: '0')).first as OrderModel;
  cartOrder.confirmed=true;
  cartOrder.date=_getNowFormatedDate();
  await databaseService.update(cartOrder);

}
String _getNowFormatedDate(){
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
  return  formatter.format(now);
}
//
// final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
// Future<void> setupNotification() async {
//   // #1
//   const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
//   //const iosSetting = IOSInitializationSettings();
//
//   // #2
//   const initSettings =
//   InitializationSettings(android: androidSetting);
//
//   // #3
//   await _localNotificationsPlugin.initialize(initSettings).then((_) {
//     debugPrint('setupPlugin: setup success');
//   }).catchError((Object error) {
//     debugPrint('Error: $error');
//   });
// }