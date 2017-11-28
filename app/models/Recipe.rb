class Recipe


  attr_accessor :recipe
  @@all = []

    def initialize (recipe)
      @recipe = recipe
      @@all << self
    end

    def self.all
      @@all
    end

    def self.most_popular
      recipe_hsh = {}
      #how many time each recipe appered in all recipe cards
      #hash of recipe => count if-else
      RecipeCard.all.each do |card|
         if recipe_hsh[card.recipe]
            recipe_hsh [card.recipe]+=1
         else recipe_hsh [card.recipe]=1
         end
      end
      recipe_hsh.sort_by {|recipe, count| count}.last[0] #hash with count
    end

    def users
      RecipeCard.all.map do |rc_instance|
        if rc_instance.recipe == self
          rc_instance.user
        end
      end.compact
    end

    def ingredients
      RecipeIngredients.all.map do |ri_instance|
        if ri_instance.recipe == self
          ri_instance.ingredient
        end
    end.compact
  end

#should return all of the ingredients in this recipe that are allergens
    def allergens
      all_ingredients = self.ingredients
        all_allergens = all_ingredients.map do |r_ingredient|
          if Allergen.all.any?{|al_instance| al_instance.ingredient == r_ingredient}
            r_ingredient
          end
        end
     all_allergens
    end


    def add_ingredients(ingredient_ins_array)
      ingredient_ins_array.each do |ingredient_ins|
        RecipeIngredient.new(self, ingredient_ins)
      end
    end

end
