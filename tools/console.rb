require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


george = User.new("george")
pizza = Recipe.new("pizza")
george_pizza = RecipeCard.new(george, pizza, Time.now, 10)
taco = Recipe.new("taco")
fish = Recipe.new("fish")
mango = Recipe.new("mango")
george_taco = RecipeCard.new(george, taco, Time.now, 2)
george_mango = RecipeCard.new(george, mango, Time.now, 5)
chili = Ingredient.new("chili")
mango_chili = RecipeIngredient.new(mango, chili)
new_all = Allergen.new(george, chili)
ham = Ingredient.new("ham")
cheese = Ingredient.new("cheese")
# Pry.start
binding.pry
