class Recipe

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipe_count = {}
    RecipeCard.all.each do |inst|
      if recipe_count.keys.include?(inst.recipe)
        recipe_count[inst.recipe] += 1
      else
        recipe_count[inst.recipe] = 1
      end
    end

    recipe_count.select do |k, v|
      if v == recipe_count.values.sort.last
        k
      end
    end.keys
  end

  def users
    RecipeCard.all.map do |inst|
      if inst.recipe == self
        inst.user
      end
    end
  end

  def ingredients #call ingredints from RecipeIngr
    RecipeIngredient.all.map { |inst| inst.ingredient if inst.recipe == self }.compact
  end

  def allergens
    ingredients.select do |ingred|
      Allergen.all.each do |inst|
        if inst.ingredient == ingred
          ingred
        end
      end
    end
  end

  def add_ingredients(ingred_inst_arr)
    ingred_inst_arr.each do |ingred_inst|
      add_to_recipe = RecipeIngredient.new(self, ingred_inst)
    end
  end

end
