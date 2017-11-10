class Ingredient

  attr_accessor :name

  def initialize(name)
    @name = name
  end


  def self.all
    RecipeIngredient.all.collect do |recipe_ingredient_instance|
      recipe_ingredient_instance.recipe.ingredient
    end
  end


  def self.most_common_allergen
    hash = {}
    Allergen.all.each do |allergen_object|
      if hash[allergen_object.ingredient_instance.name]
         hash[allergen_object.ingredient_instance.name] +=1
       else
         hash[allergen_object.ingredient_instance.name] = 1
       end
     end
     hash = hash.sort_by {|ingredient_name, occurence| occurence}.reverse.to_h
     Allergen.all.select do |allergen_object|
       allergen_object.ingredient_instance.name == hash.keys.first
     end[0].ingredient_instance
  end
end
