require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
#
today = Date.today
kat = User.new("Kat")
erik = User.new("Erik")
chris = User.new("Chris")
carrot = Ingredient.new("carrot")
celery = Ingredient.new("celery")
chknstk = Ingredient.new("chicken stock")
bread = Ingredient.new("bread")
meat = Ingredient.new("meat")
cheese = Ingredient.new("cheese")
chicken_soup = Recipe.new("Chicken_soup")
chicken_soup.add_ingredients([celery, chknstk, carrot])
sandwich = Recipe.new("sandwich")
sandwich.add_ingredients([meat, cheese, bread])
stew = Recipe.new("stew", )
#
kat_allergy = kat.declare_allergen(carrot)
erik_allergy = erik.declare_allergen(carrot)
chris_allergy = chris.declare_allergen(celery)
#
kat.add_recipe_card(chicken_soup, today, 5)
kat.add_recipe_card(sandwich, today, 2)
#
chris.add_recipe_card(chicken_soup, "10/5", 1)
chris.add_recipe_card(stew, "10/2", 5)
erik.add_recipe_card(stew, "10/3", 2)
erik.add_recipe_card(sandwich, "11/2", 4)

binding.pry

true
