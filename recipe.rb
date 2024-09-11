class Recipe
  attr_accessor :name, :description

  def initialize(attributes={})
    @name = attributes[:name]
    @description = attributes[:description]
  end
end

# Following the development of my Recipe Class above I used the code below to confirm Recipe Objects could be created successfully
# Based on the tests I ran, the Recipe Class works as intended
# The code has since been commented out to avoid disruption to the application as a whole

# recipe_obj_test = Recipe.new({name: "Egusi with assorted meats", description: "a dish rich in flavour and heritage."})
# puts(recipe_obj_test)
# puts(recipe_obj_test.name)
# puts(recipe_obj_test.description)
