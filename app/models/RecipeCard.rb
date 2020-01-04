#Each RecipeCard will store information about a Recipe a User would like to save,
#creating the relationship of a User having many Recipes through RecipeCards.

class RecipeCard
  @@all = []

  attr_accessor :user, :recipe, :rating, :date, :recipe

  def initialize(user, rating, date, recipe)

    @user = user
    @date = date
    @rating = rating
    @recipe = recipe
    @@all << self

  end

  def self.all
    @@all
  end


end


# A RecipeCard is the join between a user instance and a recipe instance. This is a has-many-through relationship.
# Build the following methods on the RecipeCard class:
# RecipeCard.all should return all of the RecipeCard instances
# RecipeCard#date should return the date of the entry
# RecipeCard#rating should return the rating (an integer) a user has given their entry
# RecipeCard#user should return the user to which the entry belongs
# RecipeCard#recipe should return the recipe to which the entry belongs
