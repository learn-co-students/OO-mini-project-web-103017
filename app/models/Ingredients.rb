class Ingredient
  @@all = []

  attr_reader :name

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    #ingredient instance that most users are allergic to
    counts = Allergen.all.inject(Hash.new(0)) do |hsh, allergen| hsh[allergen.ingredient.name] += 1
      hsh
    end
    sorted = counts.sort_by { |k,v| v  }
    sorted.last[0]
  end


end
