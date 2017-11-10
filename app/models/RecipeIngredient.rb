
class RecipeIngredient
  attr_reader :recipe, :ingredient

  @@all = []

  def initialize(recipe_instance, ingredient_instance) #bananacake, 'banana'
    @recipe = recipe_instance #bananacake = [flour, banana, egg, sugar] => (bananacake.ingredients) from recipe class
    @ingredient = ingredient_instance #banana
    @@all << self
  end

  def self.all
    @@all
  end

end
###########################################################################################
#   def ingredient #should return the ingredient instance bananacake.ingredient =  ?
#     @ingredient
#   end
#
#   def recipe #should return the recipe instance
#     @recipe #bananacake
#   end
# end
#
# RecipeIngredient is the join between an ingredient and a recipe.
# This is a has-many-through relationship

# anything = RecipeIngredient.new(bananacake, banana)
# anything.recipe.ingredients = # [flour, banana, egg, sugar]
# anything.ingredient = banana
