class Allergen
  attr_accessor :name, :user
  @@all = []

  def initialize (ingredient, user)
    @name = ingredient.name
    @ingredients = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end


end
