require 'pry'

class Recipe

  @@all = []

  attr_accessor :name, :recipecards, :users, :ingredients, :recipe_ingredients

  def initialize(name)
    @name = name
    # @users = [] # can we pull users from recipecards without direct reference?
    # @recipecards = [] # refactored into method
    # @recipe_ingredients = [] # refactored into method
    # @ingredients = [] also pull this from recipeingredients
    @@all << self
  end

  def users
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end.map {|recipecard| recipecard.user}
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end.map {|recipe_ingredient| recipe_ingredient.ingredient}
  end

  def add_recipe_card(recipecard)
    recipecard.recipe = self
  end

  def self.all
    @@all
  end

  def self.most_popular
    user_count = 0
    most_users = nil
    self.all.each do |recipe|
      if recipe.users.count > user_count
        user_count = recipe.users.count
        most_users = recipe
      end
    end
    most_users
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      # associate each ingredient with this recipe
      ingredient.recipes << self
    end
  end

  def allergens
    self.ingredients.collect do |ingredient|
      if ingredient.allergens.length > 0
        ingredient
      end ####################################
    end
    # return all ingredients in this recipe that are allergens
  end

end
