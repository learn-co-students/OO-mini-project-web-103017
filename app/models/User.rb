class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end


  def self.all
    @@all
  end

  def recipes
    # should return all of the recipes this user has recipe cards for
    RecipeCard.all.map{|recipe_card| recipe_card if recipe_card.user == self}
  end

  def add_recipe_card(recipe, date = Time.now, rating)
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
    new = RecipeCard.new(self, recipe, date, rating)
    new
  end

  def declare_allergen(ingredient)
    # should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
    Allergen.new(self, ingredient)

  end

  def allergens
    # should return all of the ingredients this user is allergic to
    Allergen.all.map { |allergen| allergen.ingredient if allergen.user == self }
  end

  def top_three_recipes
    # should return the top three highest rated recipes for this user.
    top = recipes.sort { |recipe| recipe.rating } [-3..-1]
    top.map{|recipe| recipe.recipe.name}
  end

  def most_recent_recipe
    # should return the recipe most recently added to the user's cookbook.
    recipes.last.recipe
  end

  def safe_recipes
    recipes.map do |recipe_instance|
      return recipe_instance.recipe unless recipe_instance.recipe.allergens == true
    end
  end


end
