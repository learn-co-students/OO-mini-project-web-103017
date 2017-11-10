class User
#has many recipes through recipe cards
  attr_accessor :name, :allergens

  @@all = []

  def initialize(name)
    @name = name
    @allergens = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    self.recipe_cards.map{|card| card.recipe}
  end

  def recipe_cards
    RecipeCard.all.select {|cards| cards.user == self}
  end

  def add_recipe_card(recipe, date, rating)
    new_card = RecipeCard.new(recipe, self, date, rating)
    new_card
  end

  def declare_allergen(ingredient)
    new_allergy = Allergen.new(ingredient, self)
    new_allergy
  end

  def allergens
    Allergen.all.select {|alg| alg.user == self}
  end

  def top_three_recipes
    self.recipe_cards.sort_by{ |card| card.rating}.last(3)
  end

  def most_recent_recipes
    self.recipe_cards.last
  end

end
