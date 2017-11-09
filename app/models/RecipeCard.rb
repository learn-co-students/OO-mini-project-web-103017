class RecipeCard
  #store information about a Recipe a User would like to save
  @@recipe_cards = []
  
  attr_accessor :user, :recipe, :date, :rating

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@recipe_cards << self
  end

  def RecipeCard.all
    @@recipe_cards
  end

  def date
    @date
  end

  def rating
    @rating
  end

  def user
    @user
  end

  def recipe
    @recipe
  end
end