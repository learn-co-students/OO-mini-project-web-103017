class Recipe

attr_accessor :recipecard, :users, :ingredients
attr_reader :name

@@all_recipes = []

	def initialize(name)
		@name = name
		@@all_recipes << self
		@ingredients = []
	end

	def self.all
		@@all_recipes
	end

	def users
		@users = RecipeCard.all.select do |recipecard|
			recipecard.recipe == self
		end
		@users.map do |recipecard|
			recipecard.user
		end
	end

	def add_ingredients(array)
		@ingredients = array.map do |ingredient|
			RecipeIngredient.new(self, ingredient)
		end
	end

	def add_recipe_card(recipe, date, rating=nil)
		new_recipe = RecipeCard.new(self, recipe)
		new_recipe.date = date
		new_recipe.rating = rating
		new_recipe
	end

	def ingredients
		@ingredients.map do |ingredient|
			ingredient.ingredients
		end
	end

	def self.most_popular
		sorted_recipes = @@all_recipes.sort_by do |attribute|
			attribute.users.count
		end
		sorted_recipes.last
	end
	
end
