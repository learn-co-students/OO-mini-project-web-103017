require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

def test_program

#users
  jimmy = User.new("Jimmy")

  sally = User.new("Sally")

  timmy = User.new("Timmy")

  #ingredients

  ingredient_array = []
  eggs = Ingredient.new("eggs")
    ingredient_array<<eggs
  butter = Ingredient.new("butter")
    ingredient_array<<butter
  sugar = Ingredient.new("sugar")
    ingredient_array<<sugar
  salmon = Ingredient.new("salmon")
    ingredient_array<<salmon
  milk = Ingredient.new("milk")
    ingredient_array<<milk
  bun = Ingredient.new("bun")
    ingredient_array<<bun
  beef = Ingredient.new("beef")
    ingredient_array<<beef
  cheese = Ingredient.new("cheese")
    ingredient_array<<cheese
  kale = Ingredient.new("kale")
    ingredient_array<<kale
  tomato = Ingredient.new("tomato")
    ingredient_array<<tomato


  #recipes
  recipe_array = []
  scrambled_eggs = Recipe.new("scrembled eggs")
  scrambled_eggs.add_ingredients([eggs, butter, milk])

  burger = Recipe.new("burger")
  burger.add_ingredients([bun, beef, cheese, kale])
  recipe_array << burger

  salad = Recipe.new("salad")
  salad.add_ingredients([kale, tomato, cheese, salmon])
  recipe_array << salad

  cake = Recipe.new("cake")
  cake.add_ingredients([sugar, milk, eggs, butter])
  recipe_array << cake


  fish_n_chips = Recipe.new("fish_n_chips")
  fish_n_chips.add_ingredients([sugar, salmon, eggs, butter])
  recipe_array << fish_n_chips

  pizza = Recipe.new("pizza")
  pizza.add_ingredients([sugar, cheese, eggs, butter])
  recipe_array << pizza





  #recipe cards

  recipe_card1j = RecipeCard.new(jimmy, 6, "10/22/1994", salad)
  recipe_card2j = RecipeCard.new(jimmy, 3, "10/22/1994", burger)
  recipe_card3j = RecipeCard.new(jimmy, 1, "10/22/1994", scrambled_eggs)
  recipe_card4j = RecipeCard.new(jimmy, 2, "10/22/1993", fish_n_chips)
  recipe_card5j = RecipeCard.new(jimmy, 7, "10/22/1993", cake)


  recipe_card1s = RecipeCard.new(sally, 3, "10/22/1994", salad)
  recipe_card2s = RecipeCard.new(sally, 8, "10/22/1994", scrambled_eggs)
  recipe_card3s = RecipeCard.new(sally, 2, "10/22/1994", cake)
  recipe_card4s = RecipeCard.new(sally, 1, "10/22/1994", pizza)

  recipe_card1t = RecipeCard.new(timmy, 3, "10/22/1994", burger)
  recipe_card2t = RecipeCard.new(timmy, 5, "10/22/1994", scrambled_eggs)
  recipe_card3t = RecipeCard.new(timmy, 7, "10/22/1994", pizza)
  recipe_card4t = RecipeCard.new(timmy, 9, "10/22/1994", fish_n_chips)

  recipegngredient_array = []
  recipe_array.each do |recipe|
    recipe.ingredients.each do |ingredient|
      recipegngredient_array << RecipeIngredient.new(ingredient, recipe)
    end
  end



  #allergens. Take an ingredient object
   jimmy.declare_allergen(eggs)
   timmy.declare_allergen(eggs)
   sally.declare_allergen(beef)


  jimmy.add_recipe_card(recipe_card1j, recipe_card1j.rating, recipe_card1j.date)
  jimmy.add_recipe_card(recipe_card2j, recipe_card2j.rating, recipe_card2j.date)
  jimmy.add_recipe_card(recipe_card3j, recipe_card3j.rating, recipe_card3j.date)
  jimmy.add_recipe_card(recipe_card4j, recipe_card4j.rating, recipe_card4j.date)
  jimmy.add_recipe_card(recipe_card5j, recipe_card5j.rating, recipe_card5j.date)

  sally.add_recipe_card(recipe_card1s, recipe_card1s.rating, recipe_card1s.date)
  sally.add_recipe_card(recipe_card2s, recipe_card2s.rating, recipe_card2s.date)
  sally.add_recipe_card(recipe_card3s, recipe_card3s.rating, recipe_card3s.date)
  sally.add_recipe_card(recipe_card4s, recipe_card4s.rating, recipe_card4s.date)


  timmy.add_recipe_card(recipe_card1t, recipe_card1t.date, recipe_card1t.rating)
  timmy.add_recipe_card(recipe_card2t, recipe_card2t.date, recipe_card2t.rating)
  timmy.add_recipe_card(recipe_card3t, recipe_card3t.date, recipe_card3t.rating)
  timmy.add_recipe_card(recipe_card4t, recipe_card4t.date, recipe_card4t.rating)

  binding.pry

end

test_program

Pry.start
