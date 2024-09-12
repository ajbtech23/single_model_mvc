require_relative './recipesrepository'
require_relative './recipesview'
require_relative './recipe'

class RecipesController
  def initialize(recipes_repository_obj)
    @recipes_repository_obj = recipes_repository_obj
    @recipes_view_obj = RecipesView.new
  end

  def list
    arr_recipe_objs = @recipes_repository_obj.all
    @recipes_view_obj.display(arr_recipe_objs)
  end

  def add
    recipe_obj_attr_name = @recipes_view_obj.get_recipe_name
    recipe_obj_attr_description = @recipes_view_obj.get_recipe_description
    recipe_obj_new = Recipe.new({name: recipe_obj_attr_name, description: recipe_obj_attr_description})
    @recipes_repository_obj.create(recipe_obj_new)
    list # Also works as self.list strangely...
  end

  def remove
    list
    recipe_obj_index = @recipes_view_obj.get_recipe_index
    @recipes_repository_obj.destroy(recipe_obj_index - 1)
    list
  end
end

recipes_repository_obj_new = RecipesRepository.new("dummy/file/path")
recipes_controller_obj = RecipesController.new(recipes_repository_obj_new)

recipes_controller_obj.list
recipes_controller_obj.add
recipes_controller_obj.remove
