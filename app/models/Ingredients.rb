class Ingredient
  attr_reader :name

  @@all = [] #[flour, banana, egg, sugar] :)

  def initialize(name) #create an ingredient instance banana = Ingredient.new("banana") :)
    @name = name #banana
    @@all << self
  end

  def self.all #:)
    @@all
  end

  def recipes
    result = RecipeIngredient.all.select{|x| x.ingredient == self}
    result.collect {|instance| instance.recipe}
  end

  def self.most_common_allergen
    result = Allergen.all.collect {|ingredients| ingredients.ingredient}
    result.max_by { |allergen| result.count(allergen) }
  end
    #max_by method : gives me the highest value w my condintion.
    #count, return the reoccuring value from my result. allegen = one of my ingredient
end


#RecipeIngredient is joined together by a recipe instance and an ingredient instance.
#joining the two classes allow the two data  to share data with each other
#to find a recipe, with an ingredient that I have(aka banana). I call my class
#iterate over to find the ingredient of my banana, returning a RecipeIngredient instance
# contaiing my ingredient and recipe instances. then I iterate over to ccollect the result.
