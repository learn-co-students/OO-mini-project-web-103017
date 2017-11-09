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
  #  ingredient = Allergen.all.collect{|instance| instance.ingredient}
    hash = Hash.new(0)
    Allergen.all.collect{|instance| hash[instance.ingredient] += 1}
    hash.sort_by{|k, v| v}.last.first
  end
end
