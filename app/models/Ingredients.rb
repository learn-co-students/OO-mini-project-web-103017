class Ingredient
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    allergen_hsh = Hash.new(0)
    Allergen.all.each{|allergen| allergen_hsh[allergen.ingredient] += 1}
    allergen_hsh.max_by{|allergen, count| count}[0]
  end

end
