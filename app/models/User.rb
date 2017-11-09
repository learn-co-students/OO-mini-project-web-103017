require 'pry'

class User

  attr_accessor :name, :recipes, :recipecards, :allergens

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    # @recipes = [] # don't use this
    # @recipecards = [] # refactored into the .recipecards method
    # @allergens = [] # refactored into .allergens
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def add_recipe_card(recipe, date = nil, rating = nil)
    newcard = RecipeCard.new(self, recipe, date, rating)
    newcard
  end

  # recipes only through recipecards

  def recipes
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end.map {|recipecard| recipecard.recipe}
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def top_three_recipes
    self.recipecards.sort_by do |recipecard|
      recipecard.rating
    end[0..3].sort
  end

  def most_recent_recipe
    # returns the most recently added recipe
    self.recipes[-1]
  end

end
