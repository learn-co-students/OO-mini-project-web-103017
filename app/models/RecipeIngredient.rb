
class RecipeIngredient

  attr_reader :ingredient_instance, :recipe_instance

  @@all = []

  def initialize(ingredient_instance, recipe_instance)
    @ingredient_instance = ingredient_instance
    @recipe_instance = recipe_instance
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredient
    self.ingredient_instance
  end

  def recipe
    self.recipe_instance
  end

end
