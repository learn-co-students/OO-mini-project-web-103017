class RecipeIngredient
  attr_accessor :recipe, :ingredient

  @@all = []
  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient

    @@all << self
  end

  def self.all
    @@all
  end

  # def ingredient
  #   @ingredient
  # end
  #
  # def recipe
  #   @recipe
  # end

end
