import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/models/restaurant_model.dart';

import 'recipes_in_restaurant.dart';

class RestaurantItemWidget extends StatelessWidget {
  RestaurantModel restaurant;

   RestaurantItemWidget({Key? key,required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>RecipesInRestaurantWidget(restaurant:restaurant) ,));
      },
      child: Card(child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(5) ,topLeft: Radius.circular(5)),
            child: Image.network(width: 150,height:150,restaurant.imageUrl,fit: BoxFit.fill)),
        Expanded(flex:1,child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(restaurant.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'fantasy'),),
                SizedBox(width: 10,height: 5,),
                Text(restaurant.description,style: TextStyle(color:Colors.black54),),

              ],),
          ),
        ))
      ],)),
    );
  }
}
