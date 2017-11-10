class RecipeCard
  attr_reader :recipe, :date, :rating, :user
  @@all = [] #stores all RecipeCard instances
  #who_has_what_recipe = RecipeCard.new(joe, bananacake) #pass in user instance and recipe instance

  def initialize(user_instance, recipe_instance, date, rating)
    @user = user_instance
    @recipe = recipe_instance
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
######################################################################
# A RecipeCard is the join between a user instance and a recipe instance.
# This is a has-many-through relationship.

# def user #should return the user to which the entry belongs
#   self
# end
#
# def recipe #should return the recipe to which the entry belongs
#
# end
