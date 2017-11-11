require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

seth = User.new("Seth")
tim = User.new("Tim")
steve = User.new("Steve")

# Test for user instance class methods
stew = Recipe.new("Beef Stew")
alfredo = Recipe.new("Chicken Alfredo")
sandwhich = Recipe.new("Big Mac")
borscht = Recipe.new("borscht")
salad = Recipe.new("salad")


seth.add_recipe_card(stew, 1)
seth.add_recipe_card(alfredo, 2)
seth.add_recipe_card(sandwhich, 4)
seth.add_recipe_card(borscht, 3)

#Test for User class methods
# tim.add_recipe_card(stew, 1)
# tim.add_recipe_card(alfredo, 2)
# tim.add_recipe_card(sandwhich, 3)
tim.add_recipe_card(borscht, 4)
tim.add_recipe_card(salad, 5)

steve.add_recipe_card(stew, 5)

beef = Ingredient.new("beef") #Big mac, Beef Stew
carrot = Ingredient.new("carrot")#Beef Stew, Borscht
beet = Ingredient.new("beet")#Borscht
onion = Ingredient.new("onion")#Big Mac, Beef Stew, Chicken Alfredo, Borscht
chicken = Ingredient.new("chicken")#chicken alfredo
special_sauce = Ingredient.new("Special Sauce")
peanut = Ingredient.new("Peanut")
lettuce = Ingredient.new("lettuce")

#Big Mac
RecipeIngredient.new(sandwhich, beef)
RecipeIngredient.new(sandwhich, onion)
RecipeIngredient.new(sandwhich, special_sauce)

#alfredo
RecipeIngredient.new(alfredo, onion)
RecipeIngredient.new(alfredo, chicken)

#Stew
RecipeIngredient.new(stew, beef)
RecipeIngredient.new(stew, carrot)
RecipeIngredient.new(stew, onion)

#Borscht
RecipeIngredient.new(borscht, beet)
RecipeIngredient.new(borscht, carrot)
RecipeIngredient.new(borscht, onion)

#salad
RecipeIngredient.new(salad, lettuce)



#Allergies
seth.declare_allergen(chicken)
seth.declare_allergen(peanut)
tim.declare_allergen(chicken)
tim.declare_allergen(peanut)



binding.pry
