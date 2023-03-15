import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  Map<String, dynamic> cartItemMap;
  CartItemWidget({Key? key, required this.cartItemMap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right:10),
                  child: Image.network(cartItemMap['imageUrl'],
                      fit: BoxFit.fill))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${cartItemMap['title']}"),
                  Text(' x ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.orange)),
                  Text("${cartItemMap['quantity']}"),
                ],
              ),
              Text(
                "${cartItemMap['cart_item_price']}MAD",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.indigo),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
