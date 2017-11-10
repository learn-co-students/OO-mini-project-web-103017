class RecipeIngredient

attr_accessor :recipe, :ingredients

@@all = []

	def initialize(recipe, ingredients)
		@recipe = recipe
		@ingredients = ingredients
		@@all << self
	end

	def self.all
		@@all
	end

end
