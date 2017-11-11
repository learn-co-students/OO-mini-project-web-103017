class User

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def collect_recipe_cards
    RecipeCard.all.select {|recipe_card| recipe_card if recipe_card.user == self}
  end

  def recipes
    self.collect_recipe_cards.collect {|recipe_card| recipe_card.recipe}
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, rating, Time.now)
  end

  def most_recent_recipe
    self.collect_recipe_cards.max_by {|recipe_card| recipe_card.date}.recipe
  end

   def top_three_recipes
    result = self.collect_recipe_cards.sort_by {|recipe_card| recipe_card.rating}.last(3).reverse
    result.collect {|recipe_card| recipe_card.recipe}
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def collect_allergens
    Allergen.all.select {|allergen| allergen if allergen.user == self}
  end

  def allergens
    self.collect_allergens.map {|allergen| allergen.ingredient}
  end

  def safe_recipes
    hash = Recipe.all.inject({}) {|hash, recipe| hash[recipe] = recipe.ingredients; hash}
    hash.map {|recipe, ingredients| recipe if (self.allergens & ingredients).empty?}.compact
  end

end
