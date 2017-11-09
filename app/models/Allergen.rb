class Allergen
  attr_accessor  :user, :ingredient
  @@all_allergens = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all_allergens << self
  end

  def self.all
    @@all_allergens
  end
end