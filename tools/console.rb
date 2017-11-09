require_relative '../config/environment.rb'

connie = User.new("Connie")
andy = User.new("Andy")
bob = User.new("bob")
noodles = Recipe.new("noodles")
pasta = Recipe.new("pasta")
pie = Recipe.new("pie")
shrimp = Ingredient.new("shrimp")
mushroom = Ingredient.new("shrooms")


connie.add_recipe_card(pasta, 1930384, 3)
connie.add_recipe_card(noodles, 103017, 10)
connie.add_recipe_card(pie, 129038, 8)

connie.declare_allergen(shrimp)
bob.declare_allergen(shrimp)

noodles.add_ingredients([shrimp, mushroom])



def reload
  load 'config/environment.rb'
end




binding.pry
true