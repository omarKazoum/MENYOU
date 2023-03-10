
import '../database/models/recipe_model.dart';
import '../widgets/menu/menu_item_widget.dart';

MenuItemWidget menuItemFromRecipe({required RecipeModel recipe}){
  return MenuItemWidget(description:recipe.description ,imageUrl:recipe.imageUrl ,name:recipe.name );
}