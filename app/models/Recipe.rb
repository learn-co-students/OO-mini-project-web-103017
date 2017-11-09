class Recipe

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipes_hsh = Hash.new(0)
    RecipeCard.all.each{|card| recipes_hsh[card.recipe] += 1}
    recipes_hsh.max_by{|recipe, count| count}[0]
  end

  def users
    RecipeCard.all.collect{|card| card.user if card.recipe == self}.compact.uniq
  end

  def ingredients
    RecipeIngredient.all.collect{|rec_ing| rec_ing.ingredient if rec_ing.recipe ==self}.compact.uniq
  end

  def allergens
    Allergen.all.collect do |allergen|
      allergen.ingredient if self.ingredients.include?(allergen.ingredient)
    end.compact.uniq
  end

  def add_ingredients(ingredients)
    ingredients.each{|ingredient| RecipeIngredient.new(self, ingredient)}
  end

end
