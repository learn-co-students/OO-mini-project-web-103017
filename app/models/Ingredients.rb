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
    # allergens = Ingredient.all.map do |ingredient|
    #   Allergen.all.select do |alg|
    #     alg.ingredient == ingredient
    #   end
    # end.sort_by{ |array| array.length}
    # allergens[-1][0].ingredient

    Allergen.all.map{|alg| alg.ingredient}.inject(Hash.new(0)){|i,v| i[v] += 1; i}.max_by{|k, v| v}[0]
  end


end
