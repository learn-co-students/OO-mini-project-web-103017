class User
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
    new_recipe_card = RecipeCard.new(self, recipe)
    new_recipe_card.date = date
    new_recipe_card.rating = rating
  end

  def recipes
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}.collect{|recipe_card| recipe_card.recipe}
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select{|allergen| allergen.user == self}.collect{|allergen| allergen.ingredient}
  end

  def top_three_recipes
    # How to improve and deal with two recipes of similar ratings
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}.sort_by{|recipe_card| recipe_card.rating}.last(3).collect{|recipe_card| recipe_card.recipe}
  end

  def most_recent_recipe
    # how to chose between two recipes with exact time stamp
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}.sort_by{|recipe_card| recipe_card.date}.last.recipe
  end

  def safe_recipes
    Recipe.all.collect do |recipe|
      recipe if (self.allergens & recipe.ingredients).empty?
    end.compact
  end

end
