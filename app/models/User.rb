#a User has a collection of RecipeCards.
#Each RecipeCard will store information about a Recipe a User would like to save,
#creating the relationship of a User having many Recipes through RecipeCards.
#A single Recipe can also belong to many Users.

#A Recipe also has many Ingredients, while a single Ingredient can be found in many Recipes

#There are Ingredients that some Users may be allergic to.

#run ruby tools/console.rb.
class User

  @@all = []

  attr_accessor :name

  def initialize(name)

    @name = name
    @recipe_cards = []
    #@cookbook = []
    @allergens = []

    @@all << self

  end



def recipes
  # User#recipes should return all of the recipes this user has recipe cards for
  #here i think we need to reach through recipe cards to get all the recipes
  # recipes = @recipe_cards.collect do |r_cards|
  #   r_cards.recipe
  # end

   @recipe_cards
end

def self.all
  @@all
end

def declare_allergen(ingredient)
  # User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  @allergens << Allergen.new(self, ingredient)

end

def allergens
  # User#allergens should return all of the ingredients this user is allergic to
  @allergens
end

def add_recipe_card(recipe_card, date, rating)

  # User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
   #@recipe_cards << RecipeCard.new(self, date, rating, recipe)
   @recipe_cards << recipe_card

   @recipe_cards
end

def top_three_recipes

  # User#top_three_recipes should return the top three highest rated recipes for this user.
  sorted_recipes = @recipe_cards.sort_by do |recipe|
    recipe.rating
  end

  sorted_recipes[0..2]

end


def most_recent_recipe
  # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.

   @recipe_cards.last.recipe

end

end
# User.all should return all of the user instances
# User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
# User#top_three_recipes should return the top three highest rated recipes for this user.
# User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
