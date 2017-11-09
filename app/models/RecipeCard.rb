class RecipeCard

  attr_accessor :user, :recipe, :date, :rating

  @@all = []
  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  # def date
  #   @date
  # end
  #
  # def rating
  #   @rating
  # end
  #
  # def user
  #   @user
  # end
  #
  # def recipe
  #   @recipe
  # end
end
