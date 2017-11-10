class Allergen
  attr_reader :ingredient, :user

  @@all = []

  def initialize(user_instance, ingredient_instance)
    @user = user_instance
    @ingredient = ingredient_instance
    @@all << self
  end

  def self.all
    @@all
  end
end

# An Allergen is a join between a user and an ingredient.
# This is a has-many-through relationship.
# What methods should an instance of this model respond to?
