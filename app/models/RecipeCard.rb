class RecipeCard


  attr_accessor :user, :recipe, :rating, :date, :rating

  @@all = []

  def initialize(user, recipe, rating=nil, date=nil)
    @user = user
    @recipe = recipe
    @rating = rating
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end


end
