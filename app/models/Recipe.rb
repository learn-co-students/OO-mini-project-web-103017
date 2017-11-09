class Recipe
  #belongs to many users
  # has many ingredients
  @@recipes = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @users = []
    @@recipes << self
    @ingredients = []
  end

  def users
    @users
  end

  def self.all
    @@recipes
  end

  def self.most_popular
    sorted = @@recipes.sort_by do |recipe|
      recipe.users.count
    end
    sorted.last
  end

  def users
    @users
  end

  def ingredients
    @ingredients.map do |ingredient|
      ingredient.ingredient
    end
  end

  def allergens
    self.ingredients.select do |ingredient|
      binding.pry
      ingredient.allergen == true
    end
  end

  def add_ingredients(arr)
    arr.map do |ingredient|
      recipe_ingredient = RecipeIngredient.new(self, ingredient)
      recipe_ingredient.allergen = ingredient.allergen
      @ingredients << recipe_ingredient
    end
  end

end












