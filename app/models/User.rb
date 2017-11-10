class User

  attr_reader :reader, :recipe, :user, :allergens, :name

  def initialize(name)
    @name = name
  end

  def recipes
    RecipeCard.all.collect do |recipe_card_instance|
      if recipe_card_instance.user_instance == self
        recipe_card_instance.recipe_instance
      end
    end.compact
  end

  def self.all
    RecipeCard.all.collect do |recipe_card_instance|
     recipe_card_instance.user
    end
  end

  def add_recipe_card(recipe_card_instance, date, rating)
    new_recipe = RecipeCard.new(self, recipe_card_instance, date, rating)
    new_recipe.date = date
    new_recipe.rating = rating
    new_recipe
  end

  def declare_allergen(ingredient_instance)
    new_allergen = Allergen.new(self, ingredient_instance)
  end

  def allergens
    Allergen.all.select do |allergen_instancce|
      allergen_instancce.user_instance == self
    end.collect do |allergen_instance|
      allergen_instance.ingredient_instance
    end
  end

  def most_recent_recipe #only grabbing the last array
    array_of_all_recipes = RecipeCard.all
    array_of_all_recipes.select do |recipe_card_instance|
      recipe_card_instance.user_instance == self
    end.last.recipe_instance
  end

  def top_three_recipes
    array_of_all_recipes = RecipeCard.all
    array_of_all_recipes.select do |recipe_card_instance|
      recipe_card_instance.user_instance == self
    end.sort do |recipe_card_instance, next_recipe_card_instance|
      next_recipe_card_instance.rating <=> recipe_card_instance.rating
    end.slice(0, 3)
  end

  def safe_recipes
    #should return all recipes that do not contain ingredients the user
    #is allergic to
    user_allergens = self.allergens
    user_recipes = self.recipes
    user_recipes.collect do |recipe_instance|
      array = []
      recipe_instance.ingredients.each do |ingredient_instance|
        if !user_allergens.include?(ingredient_instance)
          #if our list of allergens does not include the ingredient were looking at do nothing
        else
          array << true
        end
      end
      if array.include?(true)
      else
        recipe_instance
      end
    end.compact
  end
  
end
