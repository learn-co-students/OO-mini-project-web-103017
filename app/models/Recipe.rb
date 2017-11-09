class Recipe
  #belongs to many users through recipes
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(ingredients)
    ingredients.map do |ing|
      RecipeIngredient.new(self, ing)
    end
  end

  def ingredients
    ings = RecipeIngredient.all.select { |ris| ris.recipe == self}
    ings.map{|rs| rs.ingredient}
  end

  def recipe_cards
    RecipeCard.all.select do |card|
      card.recipe == self
    end
  end

  def users
    user_rc = RecipeCard.all.map{|card| if card.recipe == self return card.ingredient end}
    # user_rc.map {|rc| rc.user}
  end

  def allergens
    allergens = self.ingredients.map do |ing|
      Allergen.all.select do |alg|
        alg.ingredient == ing
      end
    end.flatten

    if allergens = []
      puts "No allergens!"
    else
      allergens
    end
  end


  def self.most_popular
    recipes_cards =
      Recipe.all.map do |recipe|
        RecipeCard.all.select do |card|
          card.recipe == recipe
          card
        end
      end.sort_by{ |array| array.length}
    recipes_cards[-1][0].recipe
  end

end
