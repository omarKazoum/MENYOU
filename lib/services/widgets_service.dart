
import '../database/models/recipe_model.dart';
import '../widgets/recipes/menu_item_widget.dart';

MenuItemWidget menuItemFromRecipe({required RecipeModel recipe}){
  return MenuItemWidget(description:recipe.description ,imageUrl:recipe.imageUrl ,title:recipe.title ,id:recipe.id!, price: recipe.price);
}
