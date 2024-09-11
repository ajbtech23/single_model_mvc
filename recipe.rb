class Recipe
  attr_accessor :name, :description

  def initialize(attributes={})
    @name = attributes[:name]
    @description = attributes[:description]
  end
end

recipe_obj_test = Recipe.new({name: "Egusi with assorted meats", description: "a dish rich in flavour and heritage."})
puts(recipe_obj_test)
puts(recipe_obj_test.name)
puts(recipe_obj_test.description)
