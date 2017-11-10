class Recipe

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def users
    RecipeCard.all.collect do |recipe_card_instance|
      if recipe_card_instance.recipe_instance == self
        recipe_card_instance.user_instance
      end
    end.compact
  end

  def self.all
    RecipeCard.all.collect do |recipe_card_instance|
     recipe_card_instance.recipe_instance
    end
  end

  def ingredients
    ingredients = RecipeIngredient.all.select do |recipe_card_instance|
      recipe_card_instance.recipe_instance == self
    end
    ingredients.collect do |recipe_card_instance|
      recipe_card_instance.ingredient_instance
    end
  end

  def allergens
    recipe_ingredients = self.ingredients

    #1st way
    recipe_ingredients.collect do |ingredient|
      Allergen.all.select do |allergen_instancce|
        allergen_instancce.ingredient_instance == ingredient
      end
    end.flatten
    # #2nd way
    # Allergen.all.select do |allergen_instancce|
    #   recipe_ingredients.include?(allergen_instancce.ingredient_instance)
    # end
  end

  def add_ingredients(array_of_instances_of_ingredients)
    array_of_instances_of_ingredients.each do |ingredient_instance|
      RecipeIngredient.new(ingredient_instance, self)
    end
  end


  def self.most_popular
    hash = {}
    RecipeCard.all.each do |recipe_card_instance|
      if hash[recipe_card_instance.recipe_instance.name]
         hash[recipe_card_instance.recipe_instance.name] +=1
      else
         hash[recipe_card_instance.recipe_instance.name] = 1
      end
    end
    hash = hash.sort_by {|recipe_name, occurence| occurence}.reverse.to_h
    RecipeCard.all.select do |recipe_card_object|
      recipe_card_object.recipe_instance.name == hash.keys.first
    end[0].recipe_instance
  end
end
