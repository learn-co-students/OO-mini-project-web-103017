erica = User.new("Erica")
bob = User.new("Bob")
jake = User.new("Jake")

meatloaf = Recipe.new("Meatloaf")
bread = Recipe.new("Bread")
flan = Recipe.new("Flan")
tuna = Recipe.new("Tuna")

erica.add_recipe_card(meatloaf, "July 5", 5)

erica.add_recipe_card(bread, "Aug 1", 4)

erica.add_recipe_card(flan, "Aug 1", 1)

erica.add_recipe_card(tuna, "Aug 3", 3)

bob.add_recipe_card(tuna, "Jan 1", 5)

jake.add_recipe_card(tuna, "Jan 9", 5)

tomato = Ingredients.new("tomato")
breadcrumbs = Ingredients.new("breadcrumbs")
flour = Ingredients.new("flour")
water = Ingredients.new("water")

bread.add_ingredients([flour, water])
meatloaf.add_ingredients([tomato, breadcrumbs])

erica.declare_allergen(tomato)
bob.declare_allergen(tomato)
erica.declare_allergen(flour)
