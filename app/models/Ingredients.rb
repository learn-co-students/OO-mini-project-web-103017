class Ingredient

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
    hash = Allergen.all.inject(Hash.new(0)) {|hash, allergen| hash[allergen.ingredient] += 1; hash}
    common_number = hash.sort_by {|key, value| value}.last[1]
    hash.collect {|ingredient, count| ingredient if count == common_number}.compact
  end


end
