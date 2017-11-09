class Ingredients
  attr_accessor :name
  @@all = []

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    hash = {}
    Allergen.all.map do |obj|
     if hash.keys.include?(obj.name) == false
       hash["#{obj.name}"] = 1
     else
       hash["#{obj.name}"] += 1
     end
    end
    hash.max_by {|key, value| value}[0]
  end

end
