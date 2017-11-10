require_relative '../config/environment.rb'
require 'pry'
def reload
  load 'config/environment.rb'
end

# Allergen.new
# User.new
# RecipeCard.new


# Recipe.new("bananacake")

banana = Ingredient.new("banana")
sugar = Ingredient.new("sugar")
milk = Ingredient.new("milk")


eggs = Ingredient.new("eggs")
pepper = Ingredient.new("pepper")
tomato = Ingredient.new("tomato")

joe = User.new('Joe')
molly = User.new('Molly')
soo = User.new('Soo')
#recipe class, makes a recipe.

bananacake = Recipe.new("bananacake")
tart = Recipe.new("tart")
cheesecake =  Recipe.new("cheesecake")
quiche = Recipe.new("quiche")

recipecard1 = RecipeCard.new(joe, bananacake, "monday", 4)
recipecard2 = RecipeCard.new(joe, cheesecake, "tuesday", 3)
recipecard3 = RecipeCard.new(molly, bananacake, "tuesday", 5)
recipecard4 = RecipeCard.new(molly, quiche, "tuesday", 5)

b_b = RecipeIngredient.new(bananacake, banana)
b_s = RecipeIngredient.new(bananacake, sugar)
b_m = RecipeIngredient.new(bananacake, milk)
t_s = RecipeIngredient.new(tart, sugar)
t_b = RecipeIngredient.new(tart, banana)
t_m = RecipeIngredient.new(tart, milk)
q_p = RecipeIngredient.new(quiche, pepper)
q_e = RecipeIngredient.new(quiche, eggs)

ingredients_array = [eggs, pepper, tomato]
new_recipe_card = [soo, quiche, "friday", 2]

banana_allergry = Allergen.new(soo, banana)

joe.declare_allergen(pepper)
joe.declare_allergen(banana)
joe.declare_allergen(banana)
molly.declare_allergen(milk)

#
# joe.allergen = <Ingredient:0x007fdca11e4d28 @name="banana">
bananacake.allergen
# anything.recipe.ingredients = # [flour, banana, egg, sugar]
# anything.ingredient = banana


binding.pry
