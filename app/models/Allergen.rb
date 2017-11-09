class Allergen
  #belongs to many users
  #belongs to many ingredients
  attr_reader :user, :ingredient

  @@all = []

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end


end
