class User
  #has many recipe cards
  #has many recipes through recipe cards
  @@users = []

  attr_accessor :name, :user_recipes, :user_allergies

  def initialize(name)
    @name = name
    @@users << self
    @user_recipes = []
    @user_allergies = []
  end

  def self.all
    @@users
  end

  def add_recipe_card(recipe, date, rating)
    new_recipe_card = RecipeCard.new(self, recipe, date, rating)
    if new_recipe_card.recipe == nil
      new_recipie_card.recipe = Recipe.new(recipe)
      new_recipe_card.recipe.users << self
      self.user_recipes << new_recipe_card
    else 
      new_recipe_card.recipe.users << self &&
      self.user_recipes << new_recipe_card unless new_recipe_card.recipe.users.include?(self)
    end
  end

  def declare_allergen(ingredient)
    allergy = Allergen.new(self, ingredient)
    ingredient.allergen = true
    @user_allergies << allergy
  end

  def allergens
    @user_allergies.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    ratings = @user_recipes.sort_by do |recipe|
      recipe.rating
    end
    ratings[-3..-1].reverse
  end

  def most_recent_recipe
    @user_recipes.last
  end

end
















