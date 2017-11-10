class User

attr_accessor :recipe, :recipes, :allergens
attr_reader :name

@@all_users = []

	def initialize(name)
		@name = name
		@@all_users << self
		@allergens = []
	end

	def self.all
		@@all_users
	end

	def add_recipe_card(recipe, date, rating=nil)
		new_recipe = RecipeCard.new(self, recipe)
		new_recipe.date = date
		new_recipe.rating = rating
		new_recipe
	end

	def recipes
		user_recipes = RecipeCard.all.select do |recipecard|
			recipecard.user == self
		end
		user_recipes.map do |recipecard|
			recipecard.recipe
		end
	end

	def top_three_recipes
		user_recipes = RecipeCard.all.select do |recipecard|
			recipecard.user == self
		end
		user_recipes.sort_by! do |attribute|
			attribute.rating
		end
		user_recipes.reverse.first(3)
	end

	def most_recent_recipe
		recipes.last
	end

	def declare_allergen(ingredient)
		@allergens << Allergen.new(self, ingredient)
	end

end
