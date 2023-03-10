import 'package:OnTimeDining/database/core/database_manager.dart';
import 'package:OnTimeDining/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'database/models/recipe_model.dart';

String DATABASE_NAME='test.db';
void main() async {
  late DatabaseManager databaseManager;
  WidgetsFlutterBinding.ensureInitialized();
  databaseManager=DatabaseManager.getInstance();
     databaseManager.init().then((databaseManager) {
    //   databaseManager.insert(RecipeModel(name: "some recipe", description: "lorem epsum description", imageUrl: "https://picsum.photos/200")).then((value) {
    //   runApp(MainScreen());
    // })
  runApp(MainScreen());

  });
  //create
  // var databaseManager = DatabaseManager("test_db.db");
  // databaseManager.init().then((databaseManager) {
  //   databaseManager
  //       .insert(RecipeModel(id:1,name: "recipe 2", description: "some description",imageUrl: "https://picsum.photos/200"))
  //       .then((value) => {print("recipe added")});
  //
  // });


  //update
  //  var databaseManager = DatabaseManager("test_db.db");
  // databaseManager.init().then((databaseManager) {
  //   databaseManager
  //       .update(RecipeModel(id:1,name: "recipe changed name", description: "some description"))
  //       .then((value) => {print("recipe updated")});
  // });


  //delete
 // var databaseManager = DatabaseManager("test_db.db");
 //  databaseManager.init().then((databaseManager) {
 //    databaseManager
 //        .delete(RecipeModel(id:1,name: "recipe changed name", description: "some description"))
 //        .then((value) => {print("recipe deleted")});
 //  });

  //select
  // var databaseManager = DatabaseManager("test_db.db");
  //    databaseManager.init().then((databaseManager) {
  //      databaseManager
  //          .selectAll(RecipeModel(id:1,name: "recipe changed name", description: "some description",imageUrl:"https://picsum.photos/200"))
  //          .then((value) => {print(value)});
  //    });

}
