require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

snake = User.new("Jake")
george = User.new("George")
steak = Recipe.new("steak")
curry = Recipe.new("curry")
chicken_parm = Recipe.new("Chicken Parm")

snake.add_recipe_card(steak, 20)
snake.add_recipe_card(curry, 25)
snake.add_recipe_card(chicken_parm, 15)

gluten = Ingredient.new("gluten")
snake.declare_allergen(gluten)
hops = Ingredient.new("hops")
snake.declare_allergen(hops)

chicken = Ingredient.new("Chicken")
breadcrumbs = Ingredient.new("breadcrumbs")
marinara = Ingredient.new("marinara sauce")

curry.add_ingredients([hops, gluten])
chicken_parm.add_ingredients([chicken, breadcrumbs, marinara])

george.declare_allergen(gluten)
george.add_recipe_card(chicken_parm, 20)
george.add_recipe_card(curry, 30)

chris = User.new("Chris")
chris.add_recipe_card(chicken_parm, 10)
chris.declare_allergen(gluten)

snake.add_recipe_card(curry, 10)
snake.add_recipe_card(curry, 10)
snake.add_recipe_card(curry, 10)
snake.add_recipe_card(curry, 10)
snake.add_recipe_card(curry, 10)


binding.pry
