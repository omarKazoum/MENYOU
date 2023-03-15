import 'package:flutter/material.dart';

import '../../main.dart';
import 'cart_item_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  double totalDue = 0;
  bool isLoading = true;
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    if (isLoading) loadCartItems();
    return isLoading
        ? Center(
            child: Container(
                width: 100, height: 100, child: CircularProgressIndicator()),
          )
        : ListView.builder(
            itemCount: cartItems.length+1,
            itemBuilder: (context, index) {
                if(index<cartItems.length)
                  return CartItemWidget(cartItemMap: cartItems[index]);
                else {
                  return Card(color:Colors.orange,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Toatal Due: ',style:TextStyle(color:Colors.white)),
                      Text('$totalDue MAD',style:TextStyle(color:Colors.blue.shade900,fontWeight: FontWeight.bold))
                    ],
                  ),
                ));
                }
            });
  }

  Future<void> loadCartItems() async {
    databaseService
        .query(
            "select o.id,r.title,oi.quantity,r.imageUrl,r.price*oi.quantity as cart_item_price,r.price from orders o INNER JOIN order_items oi ON oi.orderId=o.id INNER JOIN recipes r on oi.recipeId=r.id where o.confirmed==0;")
        .then((value) {
      setState(() {
        this.cartItems = List.from(value.map((e) => e));
        totalDue = 0;
        cartItems.map((e) => e['cart_item_price']).forEach((element) {
          totalDue += element;
        });
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state called in cart');
  }
}
