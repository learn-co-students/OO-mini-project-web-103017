class Allergen

  @@all = []

  attr_accessor :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    # user.allergens << self
    # ingredient.allergens << self
    @@all << self
  end

  def self.all
    @@all
  end

end
