class Recipe

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    # How to deal with edge cases where only 1 user has recipes
    # How to return multiple recipes that have same max count
    all_recipe_in_cards = RecipeCard.all.collect{|recipe_card| recipe_card.recipe}
    all_recipe_in_cards.max_by{|recipe| all_recipe_in_cards.count(recipe)}
  end

  def users
    RecipeCard.all.select{|recipe_card| recipe_card.recipe == self}.collect{|recipe_card| recipe_card.user}
  end

  def add_ingredients(ingredients)
    ingredients.each{|ingredient| RecipeIngredient.new(self, ingredient)}
  end

  def ingredients
    RecipeIngredient.all.select{|recipe_ingredient| recipe_ingredient.recipe == self}.collect{|recipe_ingredient| recipe_ingredient.ingredient}
  end

  def allergens
    allergen_ingredients = Allergen.all.collect{|allergen| allergen.ingredient}
    self.ingredients.collect do |ingredient|
      ingredient if allergen_ingredients.include?(ingredient)
    end.compact
  end

end
