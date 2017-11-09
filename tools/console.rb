require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

def test_function
  rochel = User.new("rochel")
  adam = User.new("adam")
  dad = User.new("dad")

  pancakes = Recipe.new("pancakes")
  chicken = Recipe.new("chicken")
  omelet = Recipe.new("omelet")
  soup = Recipe.new("soup")


  lemon = Ingredient.new("lemon")
  flour = Ingredient.new("flour")
  egg = Ingredient.new("egg")
  tomato = Ingredient.new("tomato")
  ketchup = Ingredient.new("ketchup")
  salt = Ingredient.new("salt")
  carrot = Ingredient.new("carrot")
  celery = Ingredient.new("celery")


  adam.add_recipe_card(omelet, "11/7", 5)
  rochel.add_recipe_card(omelet, "11/7", 4)
  dad.add_recipe_card(omelet, "11/7", 5)
  rochel.add_recipe_card(chicken, "11/7", 5)
  rochel.add_recipe_card(pancakes, "11/7", 5)
  rochel.add_recipe_card(soup, "11/7", 5)

  adam.declare_allergen(tomato)
  dad.declare_allergen(lemon)
  rochel.declare_allergen(tomato)

  chicken.add_ingredients([flour, egg, ketchup, lemon])
  omelet.add_ingredients([egg, tomato, salt])
  pancakes.add_ingredients([flour, egg, salt])
  soup.add_ingredients([carrot, celery, tomato, salt])

binding.pry
end

test_function

Pry.start
