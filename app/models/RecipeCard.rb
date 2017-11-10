class RecipeCard

  @@all = []

  attr_accessor :user, :recipe, :rating
  attr_reader :date



  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
    #when initialize add to use in recipes
  end


  def self.all
    @@all
  end



end

# george_pizza = RecipeCard.new(george, pizza)
