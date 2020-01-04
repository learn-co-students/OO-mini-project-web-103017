class Ingredient

  @@all = []
  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def self.most_common_allergen

    # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
    # here we need to look over @@all of allergen and count the occurences of this ingredient as an allergen

    all_allergens = User.all.collect do |user|
        user.allergens
    end

    ingredient = all_allergens.collect do |allergens|
      allergens.collect do |item|
          item.ingredient
      end
    end

    freq = ingredient.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    ingredient.max_by { |v| freq[v] }
  end

end


# Build the following methods on the Ingredient class
# Ingredient.all should return all of the ingredient instances
# Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
