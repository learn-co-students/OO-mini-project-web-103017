class Ingredient
 #belongs to many recipes
 #has many allergens
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergens = Ingredient.all.map do |ingredient|
      Allergen.all.select do |alg|
        alg.ingredient == ingredient
      end
    end.sort_by{ |array| array.length}
    allergens[-1][0].ingredient
  end

  def add_ingredients(ingredients)
    @ingredients << ingredients
  end


end
