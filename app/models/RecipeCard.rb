require 'pry'

class RecipeCard

  attr_accessor :recipe, :user, :date, :rating

  @@all = []

  def initialize(user, recipe, date = nil, rating = nil)
    @@all << self
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    # user.recipecards << self
    # recipe.recipecards << self
  end

  def self.all
    @@all
  end

end
