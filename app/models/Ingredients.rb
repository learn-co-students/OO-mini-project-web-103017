class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingred_count = {}
    Allergen.all.each do |inst|
      if ingred_count.keys.include?(inst.ingredient)
        ingred_count[inst.ingredient] += 1
      else
        ingred_count[inst.ingredient] = 1
      end
    end

    ingred_count.select do |k, v|
      if v == ingred_count.values.sort.last
        k
      end
    end.keys
  end



end
