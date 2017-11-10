
class Allergen

  attr_accessor :user_instance, :ingredient_instance
  @@all = []


  def initialize(user_instance, ingredient_instance)
    @user_instance = user_instance
    @ingredient_instance = ingredient_instance
    @@all << self
  end

  def user
    self.user_instance
  end

  def ingredient
    self.ingredient_instance
  end

  def self.all
    @@all
  end

end
