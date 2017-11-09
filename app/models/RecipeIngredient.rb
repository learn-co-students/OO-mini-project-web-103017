class RecipeIngredient
  @@all = []

  def self.all
    @@all
  end

  attr_accessor :recipe, :name, :ingredient


  def initialize(recipe, ingredient)
    @@all << self
    @recipe = recipe
    @ingredient = ingredient


  end
end
