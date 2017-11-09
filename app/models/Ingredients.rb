class Ingredient

  attr_accessor :name, :recipes, :recipe_ingredients, :allergens, :users
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    # @recipes = [] # use recipe_ingredients to get this
    # @recipe_ingredients = [] # refactored into method below
    # @allergens = [] # refactored into .allergens
  end

  def recipes
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.ingredient == self
    end.map {|recipe_ingredient| recipe_ingredient.recipe}
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.collect do |recipeingredient|
      recipeingredient.ingredient == self
    end
  end

  def users
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end.map {|allergen| allergen.user}
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    users = 0
    most_common = nil
    self.all.each do |ingredient|
      # return ingredient instance that the highest # of users is allergic to
      if ingredient.users.count > users
        users = ingredient.users.count # do we have to go through Allergen?
        most_common = ingredient
      end
    end
    most_common
  end

end
