class Allergen

attr_accessor :ingredient, :user

@@all = []

	def initialize(user, ingredient)
		@ingredient = ingredient
		@user = user
		@@all = self
	end

	def self.all
		@@all
	end

end
