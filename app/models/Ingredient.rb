class Ingredient

@@all = []
  attr_accessor :name

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen

    ingredient_hsh={}
      Allergen.all.each do |al_instance|
        if ingredient_hsh[al_instance.ingredient]
          ingredient_hsh[al_instance.ingredient]+=1
        else
           ingredient_hsh[al_instance.ingredient]=1
        end
      end
     ingredient_hsh.sort_by {|ingredient, count| count}.last[0]

  end

end
