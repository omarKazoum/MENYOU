import 'dart:math';

import 'package:flutter/material.dart';
import '../../services/restaurant_service.dart';

class MenuItemWidget extends StatelessWidget {
  String description;
  String title;
  String imageUrl;
  int id;

  var price;

  MenuItemWidget(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.id,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
            shape: RoundedRectangleBorder(
              //<-- 1. SEE HERE
              side: BorderSide(
                color: Colors.white10,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10.0,
            child: Container(
                padding: EdgeInsets.all(5),
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              child: Image.network(this.imageUrl))),
                      Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Flex(
                            direction: Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  title,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Center(
                                child: Text(
                                  description,
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "$price MAD",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Random.secure().nextBool()
                                          ? Colors.black
                                          : Colors.purple,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(CircleBorder()),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange),
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        onPressed: () {
                          addRecipeToCart(id!);
                          showSnackBar(
                              context: context,
                              text: "another item of '$title' added to cart");
                        },
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                        )),
                  )
                ]))));
  }
}
