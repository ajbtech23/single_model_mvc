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
    i = 0
    arr_recipe_objs.each do |recipe_obj|
      puts("#{i + 1} #{recipe_obj.name}")
      i += 1
    end
  end

end
