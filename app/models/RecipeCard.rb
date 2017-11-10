class RecipeCard

  @@all = []
  attr_accessor :date, :rating, :user, :recipe

  def initialize(user, recipe)
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end


end
