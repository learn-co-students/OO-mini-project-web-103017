class User

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.collect{|card| card.recipe if card.user == self}.compact.uniq
  end

  def add_recipe_card(recipe, date, rating)
      RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.collect{|allergen| allergen.ingredient if allergen.user ==self}.compact.uniq
  end

  def top_three_recipes
    #not working undefined method rating for nil class
    users_recipe_cards = RecipeCard.all.select{|card| card.user == self}
    users_recipe_cards.sort_by!{|card| card.rating}.reverse! #sort desc
    top_three = []
    #account for lengh < 3
    if users_recipe_cards.length > 0
      top_three << users_recipe_cards[0].recipe
    end
    if users_recipe_cards.length > 1
      top_three << users_recipe_cards[1].recipe
    end
    if users_recipe_cards.length > 2
      top_three << users_recipe_cards[2].recipe
    end
    top_three
  end

  def most_recent_recipe
    self.recipes.last
  end

  def safe_recipes
    #returning SAVED recipes w/o allergens, not all recipes
    self.recipes.reject do |recipe|
      allergic = false
      recipe.ingredients.each do |ingredient|
        allergic = true if self.allergens.include?(ingredient)
      end
      allergic
    end
  end


end
