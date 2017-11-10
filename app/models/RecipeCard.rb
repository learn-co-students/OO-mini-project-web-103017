class RecipeCard

  attr_accessor :user_instance, :recipe_instance, :rating, :date

  @@all = []

  def initialize(user_instance, recipe_instance, date, rating)
    @user_instance = user_instance
    @recipe_instance = recipe_instance
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  def date
    @date
  end

  def user
    self.user_instance
  end

  def recipe
    self.recipe_instance
  end

end
