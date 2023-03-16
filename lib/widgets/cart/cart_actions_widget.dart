import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/widgets/cart/cart_widget.dart';

import '../../services/notifications_service.dart';
import '../../services/restaurant_service.dart';

class CartActionWidget extends StatefulWidget {
  CartWidgetState cartWidgetState;

  CartActionWidget({Key? key, required this.cartWidgetState}) : super(key: key);

  @override
  State<CartActionWidget> createState() => _CartActionWidgetState();
}

class _CartActionWidgetState extends State<CartActionWidget> {
  @override
  Widget build(BuildContext context) {
    return this.widget.cartWidgetState.totalDue!=0?Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
          backgroundColor: Colors.green.shade500,
          heroTag: 'confirm',
          onPressed: () {confirmCartClicked(context);},
          child: const Icon(Icons.check_outlined)),
      FloatingActionButton(
          backgroundColor: Colors.redAccent.shade700,
          heroTag: 'clear',
          onPressed: (){emptyCartClicked(context);},
          child: const Icon(Icons.remove_shopping_cart_outlined))
    ]):Text("");
  }

  emptyCartClicked(BuildContext context) {
    print('empty cart clicked');
    if (widget.cartWidgetState.totalDue == 0) {
      showSnackBar(context: context, text: "Your cart is empty already!");
    } else {
      emptyCart();
      this.widget.cartWidgetState.reloadCart();
      showSnackBar(context: context, text: "Your cart has been reset!");
    }
  }
  confirmCartClicked(BuildContext context){
    print('confirm clicked');
    if (widget.cartWidgetState.totalDue == 0) {
      showSnackBar(context: context, text: "Your cart is empty!");
    } else {
      showSnackBar(context: context, text: "Your order is on the way!");
      confirmOrder();
      NotificationService().showNotification(
          "your order is in it's way it will arrive in 30min!");
      this.widget.cartWidgetState.reloadCart();
    }
  }
}
