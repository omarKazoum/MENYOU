import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/models/restaurant_model.dart';
import 'package:on_time_dining_flutter/widgets/restaurants/restaurant_item_widget.dart';
import '../../main.dart';

class RestaurantsListWidget extends StatefulWidget {
   const RestaurantsListWidget({Key? key}) : super(key: key);

   @override
   State<RestaurantsListWidget> createState() => _RestaurantsListWidgetState();
 }

 class _RestaurantsListWidgetState extends State<RestaurantsListWidget> {
  bool isLoading=true;
  List<RestaurantModel> restaurants=[];

  @override
   Widget build(BuildContext context) {
    if(isLoading)
      loadRestaurants();
    return isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(itemCount: restaurants.length,itemBuilder: (context, index) =>RestaurantItemWidget(restaurant: restaurants[index]));
   }

  Future<void> loadRestaurants() async {
    databaseService.selectAll(RestaurantModel(title: '', description:'', imageUrl: '')).then((value){
      setState(() {
        this.restaurants= List.from(value.map((e) => e as RestaurantModel));
        isLoading=false;
      });
    });

  }
 }
