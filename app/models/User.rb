 class User
   attr_accessor :name
  @@all = []

   def initialize (name)
     @name = name
     @@all << self
   end

   def self.all
     @@all
   end

   def recipes
     RecipeCard.all.select {|card| card.user == self}
   end

   def add_recipe_card(recipe, date = Time.now, rating)
     new_recipeCard = RecipeCard.new(recipe, date, rating, self)
   end

   def declare_allergen(ingredient)
     new_allergen = Allergen.new(ingredient, self)
   end

   def allergens
     Allergen.all.select do |obj|
       obj.user == self
       obj
     end
   end

   def top_three_choices
    self.recipes.sort_by { |recipe| recipe.rating  }.last(3)
  end

   def most_recent_recipe
     self.recipes.last
   end


 end
