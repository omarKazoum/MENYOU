import 'dart:math';

import 'package:OnTimeDining/database/core/database_manager.dart';
import 'package:OnTimeDining/database/models/recipe_model.dart';
import 'package:flutter/material.dart';

import '../../services/widgets_service.dart';


class MenuWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MenuWidgetState();
  }

}
class _MenuWidgetState extends State<MenuWidget>{
  List<RecipeModel> recipes=[];
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    if(isLoading)
      loadRecipes();
    return Scaffold(
          appBar: AppBar(title: Text("Menu")),
          body: isLoading?Center(child: Text("loading... !"),): ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return menuItemFromRecipe(recipe:recipes[index]);
            },
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {

          },
            child: Icon(Icons.check_outlined),)
      );
  }

  void loadRecipes()async {
    List<RecipeModel> recipesLoaded= await DatabaseManager.getInstance()
        .selectAll(RecipeModel(name: "", description: "", imageUrl: ""))
        .then((models) =>models.map((model) =>model as RecipeModel ) )
        .then((iterableRecipe) =>List.from(iterableRecipe)  );
    setState(() {
      this.recipes=recipesLoaded;
      isLoading=false;
    });
  }

}