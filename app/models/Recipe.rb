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
    Recipe.all.sort_by{|recipe| recipe.users.count}.last
  end

  def users
    RecipeCard.all.collect do |recipecard|
      recipecard.user.name if recipecard.recipe == self
    end.compact
  end

  def ingredients
    ingredients = RecipeIngredient.all.select{|ingredient| ingredient.recipe == self}
    ingredients.collect{|el| el.ingredient}
  end

  def allergens
    Allergen.all.collect do |allergen|
      if ingredients.include?(allergen.ingredient)
        allergen.ingredient
      end
    end.compact.uniq
  end

  def add_ingredients(ingredient_instances)
    ingredient_instances.each{|ingredient| RecipeIngredient.new(self, ingredient)}
  end

end
