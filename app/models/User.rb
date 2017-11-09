class User

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end


  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, self, recipe, rating)
    #store in user instance too?
  end

  def recipes
    my_cards = RecipeCard.all.select{|rc| rc.user == self}

    my_cards.map { |card| card.recipe }
  end

  def top_three_recipes
    my_cards = RecipeCard.all.select{|rc| rc.user == self}

    sorted = my_cards.sort_by { |e| e.rating }
    mapped = sorted.map { |e| e.recipe  }
    mapped.reverse![0..2]



  end

  def most_recent_recipe
    my_cards = RecipeCard.all.select{|rc| rc.user == self}

    sorted = my_cards.sort_by { |e| e.date }
    mapped = sorted.map { |e| e.recipe  }
    mapped.reverse![0]

  end

  def declare_allergen(ingredient_instance)
    Allergen.new(self, ingredient_instance)
  end

  def allergens
    my_as = Allergen.all.select{ |allergen| allergen.user == self}
    my_as.map { |a| a.ingredient}
  end

  def safe_recipes
    #all recipes that do not contain allergens for this user.

    Recipe.all.select do |recipe|
      safe = true
      recipe.ingredients.each do |r_i|
        if self.allergens.none? { |a| a == r_i }
          safe = true
        else
          safe = false
          break
        end
      end
      safe
    end


  end




end
