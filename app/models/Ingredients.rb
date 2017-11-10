class Ingredients

attr_accessor :ingredients, :user

@@all_ingredients = []

	def initialize(name)
		@name = name
		@@all_ingredients << self
	end

	def self.all
		@@all_ingredients
	end

end
