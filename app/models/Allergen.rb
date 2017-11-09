class Allergen
  # This class is a join between user and ingredient

  attr_accessor :user, :ingredient
  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end


  def self.all
    @@all
  end



end # => End Allergen
