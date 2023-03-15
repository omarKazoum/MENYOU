import 'package:flutter/material.dart';

import '../../services/notifications_service.dart';
import '../../services/restaurant_service.dart';

class CartActionWidget extends StatelessWidget {
  const CartActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
          backgroundColor: Colors.green.shade500,
          heroTag: 'confirm',
          onPressed: () {
            print('confirm clicked');
            showSnackBar(
                context: context, text: "Your order is on the way!");
            confirmOrder();
            NotificationService().showNotification("your order is in it's way it will arrive in 30min!");
          },
          child: const Icon(Icons.check_outlined)),
      FloatingActionButton(
          backgroundColor: Colors.redAccent.shade700
          ,
          heroTag: 'clear',
          onPressed: () {
            print('empty cart clicked');
            emptyCart();
            showSnackBar(
                context: context, text: "Your cart has been reset!");
          },
          child: const Icon(Icons.remove_shopping_cart_outlined))
    ]);
  }
}
