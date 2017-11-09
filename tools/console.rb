require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

neil = User.new("neil")
bob = User.new("bob")
jane = User.new("jane")

soup = Recipe.new("soup")
salad = Recipe.new("salad")
steak = Recipe.new("steak")
curry = Recipe.new("curry")
tacos = Recipe.new("tacos")
pizza = Recipe.new("pizza")


bob.add_recipe_card(soup, 10.05, 8)
bob.add_recipe_card(steak, 10.06, 9)
neil.add_recipe_card(steak, 10.07, 7)
jane.add_recipe_card(salad, 10.08, 5)

#testing top 3 recipes
bob.add_recipe_card(curry, 10.10, 5)
bob.add_recipe_card(tacos, 10.11, 3)

#testing RecipeIngredient
saffron = Ingredient.new("saffron")
coriander = Ingredient.new("coriander")
pepper = Ingredient.new("pepper")

soup.add_ingredients([saffron, coriander, pepper])
salad.add_ingredients([saffron])
steak.add_ingredients([coriander])

#testing allergens
bob.declare_allergen(saffron)
bob.declare_allergen(pepper)
jane.declare_allergen(pepper)
neil.declare_allergen(coriander)






binding.pry

Pry.start
