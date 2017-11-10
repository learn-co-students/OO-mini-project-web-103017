require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end




brendan = User.new('brendan')
brian = User.new('brian')
carol = User.new('carol')

lettuce = Ingredient.new("lettuce")
peanut = Ingredient.new('peanut')

brian_peanut_allergy = Allergen.new(brian, peanut)
carol_peanut_allergy = Allergen.new(carol, peanut)
brendan_lettuce_allergy = Allergen.new(brendan, lettuce)

chicken_pot_pie = Recipe.new('Chicken Pot Pie')
pizza = Recipe.new('Pizza')
tacos = Recipe.new('Tacos')
salad = Recipe.new('Salad')
cheesesteak = Recipe.new('cheeseteak')

carol_pizza_recipecard = RecipeCard.new(carol, pizza, 'today', 3)
brendan_pizza_recipecard = RecipeCard.new(brendan, pizza, 'today', 3)
brian_pizza_recipecard = RecipeCard.new(brian, pizza, 'yesterday', 4)
carol_chicken_pot_pie_recipecard = RecipeCard.new(carol, chicken_pot_pie, 'today', 4)
brian_salad_recipecard = RecipeCard.new(brian, salad, 'yesterday', 4)
brian_tacos_recipecard = RecipeCard.new(brian, tacos, 'yesterday', 1)
brendan_chicken_pot_pie_recipecard = RecipeCard.new(brendan, chicken_pot_pie, 'today', 4)
brendan_tacos_recipecard = RecipeCard.new(brendan, tacos, 'today', 5)
brendan_cheesesteak_recipecard = RecipeCard.new(brendan, cheesesteak, 'today', 2)


cheese = Ingredient.new('cheese')
meat = Ingredient.new('meat')

cheese_for_cheesesteak = RecipeIngredient.new(cheese, cheesesteak)
meat_for_cheesesteak = RecipeIngredient.new(meat, cheesesteak)
lettuce_for_cheesteak = RecipeIngredient.new(lettuce, cheesesteak)



brendan.most_recent_recipe

brendan.top_three_recipes

Ingredient.most_common_allergen

binding.pry
#User.top_three_recipes
#expect pizza, chicken_pot_pie, salad

#expecting cheesteak
#grab last object in array, somehow grab the name of the recipe

#Ingredient.most_common_allergen
#expecting peanut instace
