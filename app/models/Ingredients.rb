class Ingredient
  # belongs to many recipes
  @@ingredients = []

  attr_accessor :name, :allergen

  def initialize(name)
    @name = name
    @@ingredients << self
    @allergen = nil
  end

  def self.all
    @@ingredients
  end

  def self.most_common_allergen
    allergies = Hash.new(0)

    Allergen.all.each do |allergen|
      allergies[allergen.ingredient] += 1
    end
    allergies.sort_by do |allergen, count|
      count
    end.last[0]
  end

end