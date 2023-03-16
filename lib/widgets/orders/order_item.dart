import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  Map<String, dynamic> orderMap;

  OrderItemWidget({Key? key, required this.orderMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.orange,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${orderMap['id']}",
                style:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
              ),
              Text(
                "ordered at ${orderMap['date']}",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54),
              ),
              Text(
                "total of ${orderMap['amount']}MAD",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54),
              ),
            ],
          )
        ],
      ),
    );
  }
}
