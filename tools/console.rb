require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Add Users
josh = User.new("Josh")
ted = User.new("Ted")
jim = User.new("Jim")


# Add Recipes
pie = Recipe.new("Pie")
grilled_chicken = Recipe.new("Grilled Chicken")
salad = Recipe.new("Salad")
buffet = Recipe.new("Buffet")
pizza = Recipe.new("Pizza")


# Add Ingredients
chicken = Ingredient.new("Chicken")
tomato = Ingredient.new("Tomato")
dough = Ingredient.new("Dough")
stock = Ingredient.new("Stock")
lettuce = Ingredient.new("Lettuce")
apple = Ingredient.new("Apple")

# Add Ingredients to recipe
pie_ing = pie.add_ingredients([dough, apple])
salad.add_ingredients([lettuce, tomato, chicken])
buffet.add_ingredients(Ingredient.all)
pizza.add_ingredients([dough, tomato, chicken])

# Add Recipes to Users
josh_pie = josh.add_recipe_card(pie, 1, 5)
josh_salad = josh.add_recipe_card(salad, 2, 2)


jim_salad = jim.add_recipe_card(salad,1, 4)
jim_buffet = jim.add_recipe_card(buffet,2,4)
jim_pizza = jim.add_recipe_card(pizza,3,3)
jim_chicken = jim.add_recipe_card(grilled_chicken,4,5)


ted_salad = ted.add_recipe_card(salad,1, 4)
ted_buffet = ted.add_recipe_card(buffet,2,3)
red_pie = ted.add_recipe_card(pie,3,5)

# Add Allergen to User
josh_allergy1 = josh.declare_allergen(apple)
josh_allergy2 = josh.declare_allergen(chicken)

ted_allergy1 = ted.declare_allergen(chicken)
ted_allergy3 = ted.declare_allergen(lettuce)


binding.pry


Pry.start
