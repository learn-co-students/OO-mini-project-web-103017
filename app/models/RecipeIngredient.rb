class RecipeIngredient
  @@all_recipe_ingredients = []

  attr_accessor :recipe, :ingredient, :allergen

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @allergen = nil
    @@all_recipe_ingredients << self
  end

  def RecipeIngredient.all
    @@all_recipe_ingredients
  end

  def ingredient
    @ingredient
  end

  def recipe
    @recipe
  end


end
