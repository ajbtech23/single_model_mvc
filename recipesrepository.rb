require_relative "./recipe"

class RecipesRepository

  attr_accessor :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    @next_id = 1
  end

  def create(recipe_obj)
    @recipes << recipe_obj
  end

  def all
    return @recipes
  end

  def destroy(recipe_obj_index)
    @recipes.delete_at(recipe_obj_index)
  end
end

# The code below was written to ensure that I had successfully imported the recipe.rb module and was able to create Recipe Objects in this file as needed
# The code works as intended and can be commented out to avoid disruption to the wider application
# recipe_obj_a = Recipe.new({name: "Paella", description: "spanish excellence from the coast"})
# recipe_obj_b = Recipe.new({name: "Eforiro", description: "rich in spice, color and everything nice"})
# recipe_obj_c = Recipe.new({name: "Ogbono Soup", description: "a personal fave of close friends and family"})
# puts (recipe_obj_a.name)

# This code allows me to test the implementation of my RecipesRepository Class; I first want to ensure that I am able to access and write to the @recipes instance variable
# which is responsible for storing my Recipe Objects; this was achieved successfully below
# recipes_repository_obj = RecipesRepository.new("/dummy/file/path")
# recipes_repository_obj.recipes << recipe_obj_a
# recipes_repository_obj.recipes << recipe_obj_b
# recipes_repository_obj.recipes << recipe_obj_c

# I then wanted to test my ability to return all of the Recipe objects stored in my arr instance variable @recipes using my instance method def all; this works as intended
# print(recipes_repository_obj.all)
# I then wanted to test my ability to remove an element from my instance variable @recipes at a known index location using my def destroy instance method; this works as intended
# recipes_repository_obj.destroy(0)
# puts
# print(recipes_repository_obj.all)

# I then wanted to test my ability to add a brand new element to my arr instance variable @recipes using my def create instance method; this works as intended
# recipe_obj_d = Recipe.new({name: "Obe ati white rice", description: "the greatest dish ever!"})
# recipes_repository_obj.create(recipe_obj_d)
# puts
# print(recipes_repository_obj.all)

#In conclusion, my RecipesRepository Class works as intended; the above code can now be commented out
