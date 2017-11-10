class Recipe
  attr_reader :name
  attr_writer :name
  @@all = [] # bananacake, tart

  def initialize(name) #RecipeCard.new(joe, bananacake)
    @name = name #[flour, banana, egg, sugar]
  end

  def ingredients
    results = RecipeIngredient.all.select { |recipe_ing_relations| recipe_ing_relations.recipe == self}  #bananacake instace == bananancake
    # recipe_ing_relations.recipe.name = self.name} "bananacake" = "bananacake"
    results.collect { |instance| instance.ingredient}

  end

  def self.all
    @@all #Recipe.all = [bananacake, tart]
  end

  def self.most_popular #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards) should return all of the recipe instances
    result = RecipeCard.all.max_by { |recipe_card| RecipeCard.all.count(recipe_card.recipe) }
    result
  end

  def users #should return the user instances who have recipe cards with this recipe
    result = RecipeCard.all.select { |card| card.recipe == self}
    results.collect {|my_recipe_card| my_recipe_card.user}
  end

  def allergen #should return all of the ingredients in this recipe that are allergen

    # 1st way
    result = RecipeCard.all.select { |recipe_card| recipe_card.recipe == self } #looking for recipe instance.
    result.each {|recipe_card| recipe_card.recipe.ingredients & recipe_card.user.allergen}.flatten.uniq!
    # result[0].recipe.ingredients & result[0].user.allergen #finding common value

    # 2nd way
    allergens = Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
    allergens.map { |allergen| allergen.ingredient }

  end

  def add_ingredients(ingredients) #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe :)
    # [eggs, pepper, tomato]
    ingredients.each {|ingredient| RecipeIngredient.new(self,ingredient)}
    # associating arecipe with an ingredient. creating a new "row" aka new RecipeIngreient instance
  end
end

######################in the attr_reader##################################################################
# def ingredients #should return all of the ingredients in this recipe :)
#   @ingredients # banana.ingredients = [flour, banana, egg, sugar]
# end
######################in the attr_reader##################################################################
