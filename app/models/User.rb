require 'pry'
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
    RecipeCard.all.map do |rc_instance|
      if rc_instance.user == self
        rc_instance.recipe
      end
    end.compact
  end

  def add_recipe_card (recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen (ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.map do |al_instance|
      if al_instance.user == self
        al_instance.ingredient
      end
    end.compact
  end

  def top_three_recipes
    recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end

    recipe_cards.sort_by do |rc_instance|
        rc_instance.rating
    end

    recipe_cards.map do |instance|
          instance.recipe
     end.last(3)
  end

  def most_recent_recipe
    cards = RecipeCard.all.select do |card|
      card.user == self
    end
     cards.sort_by {|rc_instance| rc_instance.date}.last.recipe
  end

  def safe_recipe
    r_al_instances = RecipeIngredients.all.select do |r_instance|
            self.allergens.include?(r_instance.ingredient)
      end
    recipe_al = r_al_instances.map {|instance| instance.recipe}
    Recipe.all.reject do |recipe|
      recipe_al.include?(recipe)
    end

  end


end
