 class RecipeIngredient
   attr_accessor :recipe, :ingredient, :name
   @@all = []

   def initialize (ingredient, recipe)
     @name = ingredient.name
     @ingredient = ingredient
     @recipe = recipe
     @@all << self
   end

   def self.all
     @@all
   end

   def ingredient
     @ingredient
   end

   def recipe
     @recipe
   end

 end
