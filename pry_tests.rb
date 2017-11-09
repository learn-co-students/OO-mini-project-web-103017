### SETUP
chili = Recipe.new("chili")
jon = User.new("Jon")
jon_chili = jon.add_recipe_card(chili, "110917", 5.0)
beans = Ingredient.new("beans")
beef = Ingredient.new("beef")
chili_beans = RecipeIngredient.new(chili, beans)
chili_beef = RecipeIngredient.new(chili, beef)
jon_beef = Allergen.new(jon, beef)
kat = User.new("Kat")
kat_beef = Allergen.new(kat, beef)
kat_beans = Allergen.new(kat, beans)
kat_chili = kat.add_recipe_card(chili, "111017", 3.0)
salad = Recipe.new("salad")
lettuce = Ingredient.new("lettuce")
salad_lettuce = RecipeIngredient.new(salad, lettuce)
jon_salad = jon.add_recipe_card(salad, "111317", 4.5)
kat_salad = kat.add_recipe_card(salad, "111117", 4.5)

### RECIPE
Recipe.most_popular
chili.users
chili.ingredients
chili.allergens
chili.add_ingredients([beans, beef])

### USER
User.all
jon.recipes
jon.declare_allergen(salad)
jon.allergens
jon.top_three_recipes
jon.most_recent_recipe

### RECIPECARD
RecipeCard.all
jon_chili.date
jon_chili.rating
jon_chili.user
jon_chili.recipe

### INGREDIENT
Ingredient.all
Ingredient.most_common_allergen ####

### RecipeIngredient
chili_beans.ingredient
chili_beef.recipe

### ALLERGEN
Allergen.all
