require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Veggie soup
# ingredients = carrot, tomato, celery
# user = elli
# allergic to = celery

soup = Recipe.new("soup")
carrot = Ingredient.new("carrot")
tomato = Ingredient.new("tomato")
celery = Ingredient.new("celery")
elli = User.new("elli")
soup_card = RecipeCard.new(elli, soup, "11/11/12", 5)
soup_ingred = RecipeIngredient.new(soup, carrot)
soup_ingred2 = RecipeIngredient.new(soup, tomato)
soup_ingred3 = RecipeIngredient.new(soup, celery)
allergen = Allergen.new(elli, celery)
grilled_fish = Recipe.new("grilled_fish")
fish = Ingredient.new("fish")
lemon = Ingredient.new("lemon")
grilled_fish.add_ingredients([fish, lemon])

binding.pry
