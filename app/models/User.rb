class User

  attr_accessor :name
  @@users = []
  def initialize(name)
    @name = name
    @@users << self

  end

  def self.all
    @@users
  end

  def recipes
    RecipeCard.all.map do |inst|
      if inst.user == self
        inst.recipe
      end
    end
  end

  def add_recipe_card(recipe, date, rating)
    recipe_card = RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingred_inst)
    allergen_new = Allergen.new(ingred_inst)
  end

  def allergens
    Allergen.all.map do |inst|
      if inst.user == self
        inst.ingredient
      end
    end
  end

  def top_three_recipes
    ratings_arr = RecipeCard.all.map do |inst|
      if inst.user == self
        inst
      end
    end.sort_by {|inst| inst.rating}.reverse.slice(0,3)
    ratings_arr.map do |inst|
      inst.recipe
    end
  end

  def most_recent_recipe
    RecipeCard.all.map do |inst|
      if inst.user == self
        inst.recipe
      end
    end.last
  end

  def safe_recipes
    Recipe.all.select do |inst|
      if (inst.ingredients & allergens).length == 0
        inst
      end
    end
  end


end
