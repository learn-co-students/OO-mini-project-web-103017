neil = User.new("neil")
bob = User.new("bob")
jane = User.new("jane")

soup = Recipe.new("soup")
salad = Recipe.new("salad")
steak = Recipe.new("steak")
curry = Recipe.new("curry")
tacos = Recipe.new("tacos")
pizza = Recipe.new("pizza")


bob.add_recipe_card(soup, 10.5, 8)
bob.add_recipe_card(steak, 10.6, 9)
neil.add_recipe_card(steak, 10.7, 7)
jane.add_recipe_card(salad, 10.8, 5)

#testing top 3 recipes
bob.add_recipe_card(curry, 10.10, 5)
bob.add_recipe_card(tacos, 10.11, 3)

#testing allergens
bob.declare_allergen()
