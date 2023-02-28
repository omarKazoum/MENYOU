import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuItemWidget extends StatelessWidget {
  Color color;

  String text;

  Image image;

  MenuItemWidget(
      {Key? key,
      required this.color,
      required this.image,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
            
            shape: RoundedRectangleBorder( //<-- 1. SEE HERE
              side: BorderSide(
                color: Colors.white10,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 15.0,
            child: Container(
                padding: EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    print("item tapped");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("item $text added to card successfully!")));
                  },
                  splashColor: Colors.lightBlue,
                  highlightColor: Colors.lightBlue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      image,
                      Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
 RatingBar.builder(itemBuilder: (context,index){
                              return Container(width:10,height:10,child:Icon(Icons.star,color: Colors.amber,size: 8,));
                            }, onRatingUpdate: (rating){
                              print("rating updated");
                            },itemCount: 5,allowHalfRating: false,initialRating: Random.secure().nextDouble()),

                          Center(
                            child: Text(
                              text,
                              style: TextStyle(
                                  color: this.color,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n Aliquid atque natus nemo, soluta unde voluptate!",
                              style: TextStyle(
                                  color: this.color,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: Random.secure().nextBool()
                                  ? Colors.black
                                  : Colors.purple,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))));
  }
}

class MenuWidget extends StatelessWidget {
  late BuildContext context;

  MenuWidget({super.key});
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        appBar: AppBar(title: Text("Menu")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return MenuItemWidget(
                image: Image.asset("assets/imgs/dessert.jpeg"),
                color: Colors.black,
                text: "Dessert " + index.toString(),
              );
            },
        ),
        floatingActionButton: SizedBox(
            width: 300,
            height: 100,
            child: Card(
              shadowColor: Colors.black,
              elevation: 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Container(
                            child: Text("15 items"),
                            padding: EdgeInsets.all(15))),
                    ElevatedButton(
                        onPressed: () {
                          print('btn pressed');
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Page under maintainance")));                         },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text("Checkout now"), Icon(Icons.payment)]))
                  ]),
            )));
  }
}