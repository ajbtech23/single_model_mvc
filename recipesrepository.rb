require "csv"
require_relative "./recipe"

class RecipesRepository

  attr_accessor :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    @next_id = 1
    File.exist?(@csv_file_path) ? load_csv : puts("Houston, we have a problem...")
  end

  def create(recipe_obj)
    recipe_obj.id = @next_id
    @recipes << recipe_obj
    @next_id += 1
    save_csv
  end

  def all
    return @recipes
  end

  def destroy(recipe_obj_index)
    @recipes.delete_at(recipe_obj_index)
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @recipes << Recipe.new(row)
    end
    @next_id = @recipes.empty? ? 1 : @recipes[-1].id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w[id name description]
      @recipes.each do |recipe|
        csv << [recipe.id, recipe.name, recipe.description]
      end
    end
  end
end

# The code below tests and confirms a number of things; quite extensive so bare with the significant verbage on the way
# (1) Our Model driven CSV Table provides persistent storage of our data; to make full use of this CSV table we need the ability to load a record (row) and turn it into an Object based on our Model for manipulation in our code
# (2) To achieve this, the load_csv instance method is created within the _repository.rb file i.e. our ORM interface which takes requests from the controller and executes queries against the CSV table
# (3) For this load_csv instance method to work there must be a connection established with the CSV table; this is achieved in the def initialize method above
# (4) Our @next_id instance variable is also updated to be n + 1 the value of the id for the last record from the csv table n
# (5) If everything has worked as intended when we run the def all instance method the _repository.rb should be able to return all of the records (rows) from the CSV table which have been loaded and tranformed into Model Objs
RECIPES_CSV_FILE = File.join(__dir__, "./recipes.csv")
recipes_repository_obj_test = RecipesRepository.new(RECIPES_CSV_FILE)
puts(recipes_repository_obj_test.all)

# The code below not only puts the 'Create' instance method of our mock ORM vis a vis the _repository.rb file but goes even further to then immediately update the Model driven CSV Table
# through the addition of a new record (row) into the CSV Table; this is achieved by the save_csv instance method; we also autoincrement the @next_id instance variable
recipes_repository_obj_test.create(Recipe.new({id: 0, name: "Roast duck with noodles", description: "Peking you did right by me!"}))

(recipes_repository_obj_test.recipes).each do |recipe_obj_proto|
  puts("Confirmed ID: #{recipe_obj_proto.id} #{recipe_obj_proto.name} ==> #{recipe_obj_proto.description}")
end
# The code below was written to ensure that I had successfully imported the recipe.rb module and was able to create Recipe Objects in this file as needed
# The code works as intended and can be commented out to avoid disruption to the wider application
# recipe_obj_a = Recipe.new({name: "Paella", description: "spanish excellence from the coast"})
# recipe_obj_b = Recipe.new({name: "Eforiro", description: "rich in spice, color and everything nice"})
# recipe_obj_c = Recipe.new({name: "Ogbono Soup", description: "a personal fave of close friends and family"})

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
