require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


yuliya = User.new("Yuliya")
tom = User.new ("Tom")
mike = User.new ("Mike")

noodles = Ingredient.new("noodles")
chicken = Ingredient.new ("chicken")

soup = Recipe.new("soup")
pasta = Recipe.new("pasta")
salad = Recipe.new("salad")
grilled_chicken = Recipe.new("grilled chicken")

allergy1 = Allergen.new(yuliya, noodles)
allergy2 = Allergen.new(yuliya, chicken)
allergy3 = Allergen.new(tom, noodles)

recipe1 = RecipeCard.new(yuliya, soup, 1, 3)
recipe2 = RecipeCard.new(tom, salad, 4, 5)
recipe3 = RecipeCard.new(yuliya, pasta, 3, 4)
recipe4 = RecipeCard.new(tom, grilled_chicken, 3, 2)
recipe5 = RecipeCard.new(yuliya, pasta, 1, 4)
recipe6 = RecipeCard.new(yuliya, salad, 7, 3)
recipe7 = RecipeCard.new(yuliya, soup, 3, 5)
recipe8 = RecipeCard.new(yuliya, pasta, 5, 4)


ingredients1 = RecipeIngredients.new(soup, chicken)



binding.pry
