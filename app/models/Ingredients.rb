class Ingredient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    # should return the ingredient instance that the highest number of users are allergic to
    Allergen.all.sort{|allergen| allergen.ingredient.count}.last
  end






end
