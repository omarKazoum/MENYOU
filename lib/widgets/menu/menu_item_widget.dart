import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuItemWidget extends StatelessWidget {
  String description;
  String name;
  String imageUrl;
  int id;

  MenuItemWidget(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.description,required this.id})
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
                child: InkWell(
                  onTap: () {
                    print("item tapped");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("item $name added to card successfully!")));
                  },
                  splashColor: Colors.lightBlue,
                  highlightColor: Colors.lightBlue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Image.network(this.imageUrl)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                description,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Center(

                                child: Text(
                                  description,
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Random.secure().nextBool()
                                      ? Colors.black
                                      : Colors.purple,
                                ),
                              ),
                              IconButton(onPressed: (){

                              }, icon: Icon(Icons.add_shopping_cart_outlined,color: Colors.green,))
                            ],)

                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
  addToCart(){
    /**
     * todo add item to cart by id
     */
  }
}
