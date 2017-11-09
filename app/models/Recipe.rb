class Recipe

  attr_accessor :name
  @@all = []
  @users = []
  @ingredients = []
  @allergens = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # Return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    recipes = {}
    RecipeCard.all.each do |card|
      if recipes[card.recipe]
        recipes[card.recipe] +=1
      else
        recipes[card.recipe] = 1
      end
    end
    recipes.sort_by{|k, v| v}.reverse.first

  end

  # Return all user instances who have this recipe
  def users
    RecipeCard.all.collect do |card|
      card.user if card.recipe == self
    end.compact
  end

  # Return all ingredients in this recipe
  def ingredients
    RecipeIngredient.all.collect do |relationship|
        relationship.ingredient if relationship.recipe == self
    end.compact
  end

  # Return all ingredients that are allergens
  def allergens
    self.ingredients.collect do |ingredient|
      ingredient if ingredient.is_allergen?
    end.compact
  end

  # Take array of ingredients as an arg and associate each ingredient with this recipe
  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end

  end





end # --> End Recipe
