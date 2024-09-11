require_relative './recipesview'
require_relative './recipe'

class RecipesController
  def initialize(recipes_repository_obj)
    @recipes_repository_obj = recipes_repository_obj
    @recipes_view_obj = RecipesView.new
  end

  def list
    arr_recipe_objs = @recipes_repository_obj.all
    @recipesview.display(arr_recipe_objs)
  end

  def add
    recipe_obj_attr_name = @recipes_view_obj.get_recipe_name
    recipe_obj_attr_description = @recipes_view_obj.get_recipe_description

    recipe_obj_new = Recipe.new({name: recipe_obj_attr_name, description: recipe_obj_attr_description})

    @recipes_repository_obj.create(recipe_obj_new)
    # Following the creation and addition of a new Recipe obj to the CSV table the def list instance method above...
    # ...should be run again to trigger a visual rendering of the new collection; need to figure out how to do this
  end

  def remove
    @recipes_repository_obj.destroy(recipe_obj_index)
    # Following the creation and addition of a new Recipe obj to the CSV table the def list instance method above...
    # ...should be run again to trigger a visual rendering of the new collection; need to figure out how to do this
  end
end
