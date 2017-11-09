require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end

priyam = User.new("Priyam")
richard = User.new("Richard")
User.all
richard = User.new("Richard")

cooked_rice = Recipe.new
tomato_soup = Recipe.new
chicken_rice = Recipe.new
boulabaise = Recipe.new
chicken_w_tomato = Recipe.new
cooked_chicken = Recipe.new
Recipe.all

water = Ingredient.new
rice = Ingredient.new
tomato = Ingredient.new
spice = Ingredient.new
chicken = Ingredient.new
salt = Ingredient.new
Ingredient.all

priyam.add_recipe_card(cooked_rice, DateTime.parse('3rd Feb 2001 04:05:06+03:30'),1)
priyam.add_recipe_card(tomato_soup, DateTime.parse('3rd Feb 2002 04:05:06+03:30'),2)
priyam.add_recipe_card(chicken_rice, DateTime.parse('3rd Feb 2003 04:05:06+03:30'),2)
priyam.add_recipe_card(boulabaise, DateTime.parse('3rd Feb 2004 04:05:06+03:30'),4)
priyam.add_recipe_card(chicken_w_tomato, DateTime.parse('3rd Feb 2005 04:05:06+03:30'),5)
richard.add_recipe_card(chicken_w_tomato, DateTime.parse('3rd Feb 2004 04:05:06+03:30'),4)
richard.add_recipe_card(cooked_chicken, DateTime.parse('3rd Feb 2004 04:05:06+03:30'),5)

priyam.recipes
RecipeCard.all

priyam.top_three_recipes
priyam.most_recent_recipe

cooked_rice.add_ingredients([water, rice, salt])
tomato_soup.add_ingredients([tomato, salt])
chicken_rice.add_ingredients([chicken, water, salt])
boulabaise.add_ingredients([water, rice, tomato, spice, chicken, salt])
chicken_w_tomato.add_ingredients([chicken, tomato, water])
cooked_chicken.add_ingredients([chicken, water, salt])

priyam.declare_allergen(tomato)
priyam.allergens
richard.declare_allergen(chicken)
priyam.declare_allergen(chicken)
Allergen.all

Pry.start
