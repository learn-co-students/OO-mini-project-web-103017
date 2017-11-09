 class Recipe
   attr_accessor :users, :ingredients, :allergens, :recipecards, :name
   @@all_recipes = []

   def initialize (name, ingredients_array)
    @name = name
    @@all_recipes << self
   end

   def self.all
     @@all_recipes
   end


   def self.most_popular
     hash = {}
     RecipeCard.all.map do |obj|
      if hash.keys.include?(obj.recipe.name) == false
        hash["#{obj.recipe.name}"] = 1
      else
        hash["#{obj.recipe.name}"] += 1
      end
     end
     hash.max_by {|key, value| value}[0]
    end

   def self.recipecards
     RecipeCard.all.select do
       |cardObj|
       cardObj.recipe == self
        cardObj
     end
   end

   def users
     RecipeCard.all.select do |obj|
       obj.recipe == self
        obj.user
     end.compact
   end

   def ingredients
     RecipeIngredient.all.select do |ing|
      ing.recipe == self
      ing
     end
   end

   def rating
     RecipeCard.all.find do |cardObj|
       if cardObj.recipe == self
         cardObj.rating
       end
     end
   end

   def allergens
     self.ingredients.select do |ingredientObj|
       Allergen.all.select do |allergenObj|
         allergenObj.name == ingredientObj.name
       end
     end
   end

   def add_ingredients (ingredients)
     ingredients.each do |ingredient|
       ringredient = RecipeIngredient.new(ingredient, self)
     end
   end

 end
