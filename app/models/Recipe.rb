#A single Recipe can also belong to many Users
#A Recipe also has many Ingredients, while a single Ingredient can be found in many Recipes
#There are Ingredients that some Users may be allergic to.

class Recipe

  @@all = []
  attr_reader :name
  def initialize(name)
    @name = name
    @users = []
    @ingredients = []
    @@all << self

  end

  def self.all
    @all
  end

  def self.most_popular
    # Recipe.most_popular should return the recipe instance with the highest number
    #of users (the recipe that has the most recipe cards) should return all of the recipe instances
      occurence_hash = {}
      recipes = RecipeCard.all.collect do |card|
          card.recipe #returns a list of recipecards
      end
      recipes.delete_if{|recipe| recipe.class != self}

      names = recipes.collect do |recipe|
        recipe.name
      end
      freq = names.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

      most_freq = names.max_by {|v| freq[v]}

      recipes.select do |recipe|
        recipe.name == most_freq
      end.first

  end

  def users
    # Recipe#users should return the user instances who have recipe cards with this recipe
    #users_with_this_recipe = []

    # User.all.each do |user| #for ever user,
    #   user.recipes.each do |cards| # go over all of his recipe cards
    #     if cards.recipe == self #if his recipe card recipe matches the name of this recipe
    #       users_with_this_recipe << user ## add user instance to users_with_this_recipe
    #       break
    #     end
    #   end
    # end
    # users_with_this_recipe

    #
    user_rc = RecipeCard.all.select {|card| card.recipe == self}
    user_rc.map{|rc| rc.user}

  end

  def ingredients
    # Recipe#ingredients should return all of the ingredients in this recipe

    recipes_ings = RecipeIngredient.all.select{|card| card.recipe == self}

    recipes_ings.map{|ing| ing.ingredient}
  end

  def allergens
    # Recipe#allergens should return all of the ingredients in this recipe that are allergens

    ings = self.ingredients.collect do |ings|
       ings
    end


    alls = Allergen.all.collect do |allergen|
      allergen.ingredient
    end
    # allergens_in_this_recipe = []
    # ings.each do |item|
    #   if alls.include?(item)
    #     allergens_in_this_recipe << item
    #   end
    # end

    alls & ings
    # allergens_in_this_recipe

  end

  def add_ingredients(ingredients)

    #@ingredients = ingredients

    ingredients.map do |ing|
      RecipeIngredient.new(ing, self)
    end
  end

end



# Recipe.all should return all of the recipe instances
# Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards) should return all of the recipe instances
# Recipe#users should return the user instances who have recipe cards with this recipe
# Recipe#ingredients should return all of the ingredients in this recipe
# Recipe#allergens should return all of the ingredients in this recipe that are allergens
# Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
