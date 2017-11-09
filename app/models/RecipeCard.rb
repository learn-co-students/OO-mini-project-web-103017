 class RecipeCard
   attr_accessor :date, :rating, :user, :recipe
   @@all = []
   def initialize (recipe, date, rating, user)
     @recipe = recipe
     @date = date
     @rating = rating
     @user = user
     @@all << self
   end

   def date
     @date
   end

   def rating
     @rating
   end

   def recipe
     @recipe
   end

   def self.all
     @@all
   end

 end
