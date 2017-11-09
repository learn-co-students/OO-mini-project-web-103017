require 'pry'
class Ingredient

  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  # Return the instance of ingredient that the highest number of users is allergic to
  def self.most_common_allergen
    allergies = {}
    Allergen.all.each do |allergy|
      if allergies[allergy.ingredient]
        allergies[allergy.ingredient] +=1
      else
        allergies[allergy.ingredient] = 1
      end
    end
    allergies.sort_by{|k, v| v}.reverse.first

  end

  def is_allergen?
    Allergen.all.any?{|allergy| allergy.ingredient == self}
  end

  def self.all
    @@all
  end







end # => End Ingredient
