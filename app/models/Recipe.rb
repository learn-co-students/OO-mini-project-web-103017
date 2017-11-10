class Recipe

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards) should return all of the recipe instances
    @@all.sort_by {|recipe| recipe.users.count }.last
  end

  def users
    # should return the user instances who have recipe cards with this recipe
    RecipeCard.all.map { |recipe_card| recipe_card.user if recipe_card.recipe == self}.compact
  end


  def ingredients
    # should return all of the ingredients in this recipe
    RecipeIngredient.all.map { |recipe_ingredient|  recipe_ingredient.ingredient if recipe_ingredient.recipe == self}
  end

  def allergens
    Allergen.all.map { |allergen| return allergen.ingredient if ingredients.include?(allergen.ingredient)}
  end

  def add_ingredients(ingredient_instances)
    # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredient_instances.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end


end
