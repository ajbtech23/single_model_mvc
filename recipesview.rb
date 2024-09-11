class RecipesView

  def get_recipe_name
    print("What is the name of the recipe you'd like to add to your collection?\n> ")
    return gets.chomp
  end

  def get_recipe_description
    print("What is the description of the recipe you'd like to add to your collection?\n> ")
    return gets.chomp
  end

  def get_recipe_index
    print("Which recipe from your collection would you like to delete?\n> ")
    return gets.chomp.to_i
  end

  def display(arr_recipe_objs)
    arr_recipe_objs.each do |recipe_obj|
      puts(recipe_obj)
    end
  end

end

recipes_view_obj_test = RecipesView.new
puts(recipes_view_obj_test.get_recipe_name)
puts(recipes_view_obj_test.get_recipe_description)
puts(recipes_view_obj_test.get_recipe_index)
