class Recipe

  @@all = []

  attr_reader :name



  def initialize(name)
    @name = name
    #@ingredients = []
    @@all << self
  end

  def self.all
    @@all
  end

  def users
    my_cards = RecipeCard.all.select{|rc| rc.recipe == self
    }

    my_cards.map { |card| card.user  }.uniq

  end



  def self.most_popular

    counts = RecipeCard.all.inject(Hash.new(0)) do |counts_hsh, card|
      #binding.pry
      counts_hsh[card.recipe.name] += 1
      counts_hsh
    end
    sorted = counts.sort_by { |a, b| b  }
    sorted.last[0]

  end



  def allergens
    #return all of the ingredients in this recipe that anyone is allergic to

    ingredient_list = self.ingredients

    return_arr = ingredient_list.map do |ingredient_test|
      if Allergen.all.any? { |allergen| allergen.ingredient == ingredient_test  }
        ingredient_test
      else
        nil
      end
    end
    return_arr.compact

  end

  def add_ingredients(ingredient_array)
    ingredient_array.map { |ingredient| RecipeIngredient.new(self, ingredient)}
  end

  def ingredients
    my_ris = RecipeIngredient.all.select{|ri| ri.recipe == self}

    my_ris.map { |ri| ri.ingredient  }
  end



end
