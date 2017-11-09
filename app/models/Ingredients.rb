class Ingredient
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    all_ingredient_in_allergen = Allergen.all.collect{|allergen| allergen.ingredient}
    all_ingredient_in_allergen.max_by{|ingredient| all_ingredient_in_allergen.count(ingredient)}
  end

end
