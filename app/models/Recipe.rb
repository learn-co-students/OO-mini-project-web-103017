class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    hash = RecipeCard.all.inject(Hash.new(0)) {|hash, recipe_card| hash[recipe_card.recipe] += 1; hash}
    popular_number = hash.sort_by {|recipe, number| number}.last[1]
    hash.collect {|recipe, tally| recipe if tally == popular_number}.compact
  end


  def users
    RecipeCard.all.collect {|recipe_card| recipe_card.user if recipe_card.recipe == self}.compact
  end

  def ingredients
    RecipeIngredient.all.collect {|recipe_ingredient| recipe_ingredient.ingredient if recipe_ingredient.recipe == self}.compact
  end

  def add_ingredients(array)
    array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def allergens
    result = Allergen.ingredients.select {|ingredient| ingredient if self.ingredients.include?(ingredient)}
    result.any? ? result : "There are no allergens in the recipe for #{self.name}"
  end

end
