class User
  attr_reader :name

  @@all = [] #joe, molly

  def initialize(name) #"string"
    @name = name
    @@all << self
  end

  def self.all #should return all of the user instances :)
    @@all
  end

  def recipes #should return all of the recipes this user has recipe cards for
    RecipeCard.all.select {|recipe_card| recipe_card.user == self} #calling user instance
  end

  def add_recipe_card(recipe_instance, date, rating) # accept a recipe instance, date, and rating as an argument, and create a new recipe card for this user and the given recipe
    new_recipe_card = RecipeCard.new(self, recipe_instance, date, rating)
    new_recipe_card
  end

  def declare_allergen(ingredient_instance) #and create a new allergen instance for this user and the given ingredient
    Allergen.new(self, ingredient_instance)

  end

  def allergen # should return all of the ingredients this user is allergic to
    result = Allergen.all.select {|allergen| allergen.user == self }
    result.collect {|ingredient| ingredient.ingredient}
  end

  def top_three_recipes #should return the top three highest rated recipes for this user.
    self.recipes.sort_by {|card| card.rating}j.last(3)
  end

  def most_recent_recipes #should return the recipe most recently added to the user's cookbook.s
    self.recipes.last
  end
end
