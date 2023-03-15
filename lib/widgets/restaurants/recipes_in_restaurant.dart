import 'package:flutter/material.dart';
import 'package:on_time_dining_flutter/database/models/recipe_model.dart';
import 'package:on_time_dining_flutter/database/models/restaurant_model.dart';
import 'package:on_time_dining_flutter/widgets/cart/cart_actions_widget.dart';
import 'package:on_time_dining_flutter/widgets/recipes/menu_item_widget.dart';
import '../../main.dart';
import '../../services/restaurant_service.dart';

class RecipesInRestaurantWidget extends StatefulWidget {
  final RestaurantModel restaurant;

  const RecipesInRestaurantWidget({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RecipesInRestaurantWidget> createState() =>
      _RecipesInRestaurantWidgetState();
}

class _RecipesInRestaurantWidgetState extends State<RecipesInRestaurantWidget> {
  bool isLoading = true;
  List<RecipeModel> recipes = [];

  @override
  Widget build(BuildContext context) {
    if (isLoading) loadRecipes();

    print("restautId ${widget.restaurant.id}");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.restaurant.title),
        ),
        body: ListView(children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.maxFinite,
                    child: Image.network(
                      widget.restaurant.imageUrl,
                      fit: BoxFit.fitWidth,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.restaurant.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.restaurant.description,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Recipes:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                getRecipesWidget()
              ],
            ),
          )
        ]),
        floatingActionButton:
            null);
  }

  Future<void> loadRecipes() async {
    databaseService
        .selectAllWhere(
            RecipeModel(
                id: 0,
                title: '',
                description: '',
                imageUrl: '',
                price: 1,
                restaurantId: 0),
            whereColName: 'restaurantId',
            whereColValue: widget.restaurant.id.toString())
        .then((value) {
      setState(() {
        this.recipes = List.from(value.map((e) => e as RecipeModel));
        isLoading = false;
      });
    });
  }

  getRecipesWidget() {
    List<Widget> recipeWidgets =
        List.from(recipes.map((recipe) => GestureDetector(
            onTap: null,
            child: MenuItemWidget(
              title: recipe.title,
              description: recipe.description,
              id: recipe.id!,
              imageUrl: recipe.imageUrl,
              price: recipe.price,
            ))));
    return isLoading
        ? Center(
            child: Container(
                width: 100, height: 100, child: CircularProgressIndicator()),
          )
        : Column(
            children: [...recipeWidgets],
          );
  }
}
