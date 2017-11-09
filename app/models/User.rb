class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.collect do |recipecard|
      recipecard if recipecard.user == self
    end.compact
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, Time.now, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.collect{|allergen| allergen.ingredient if allergen.user == self}.compact
  end

  def top_three_recipes
    self.recipes.sort_by{|recipe_card| recipe_card.rating}.reverse.first(3)
  end

  def most_recent_recipe
    self.recipes.sort_by{|recipe_card| recipe_card.date}.last
  end
end
