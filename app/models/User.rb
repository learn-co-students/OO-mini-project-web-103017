require'pry'
class User

  @@all = []

  attr_accessor :name,:date

  def initialize(name)
    @name = name
    @@all << self
  end

  # Take a recipe instance, date and rating as args
  # create new RecipeCard for the user
  def add_recipe_card(recipe, date, rating)
    card = RecipeCard.new(recipe, self, date, rating)
    card
  end

  # Take an instance of ingredient as arg
  # create a new allergen instance for this user and ingredient
  def declare_allergen(ingredient)
    allergen = Allergen.new(self, ingredient)
  end


  def self.all
    @@all
  end

  #return all recipes this user has recipe cards for
  def recipes
    RecipeCard.all.collect do |card|
       card.recipe if card.user == self
    end.compact
  end

  # Return array of ingredients user is allergic to
  def allergens
    Allergen.all.collect do |allergy|
        allergy.ingredient if allergy.user == self
    end.compact
  end

  # Return the top three highest rated recipes
  def top_three_recipes
    top = self.recipe_cards.sort_by{|card| card.rating}.reverse[0..2]
    top.collect{|card| card.recipe}
  end

  # Return the three most recent recipes
  def most_recent_recipe
    recent = self.recipe_cards.sort_by{|card| card.date}.last.recipe
  end

  def recipe_cards
    RecipeCard.all.select do |card|
       card.recipe if card.user == self
    end
  end

  def safe_recipes
    self.recipes.collect do |recipe|
      recipe if !recipe.allergens.any?{|item| self.allergens.include?(item)}
    end.compact
  end
end # --> End User
