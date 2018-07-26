class Ingredient
	attr_accessor name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	#helper method
	def user_count_allergic_to
		Allergen.all.select do |allergen|
			allergen.ingredient == self
		end.length
	end


	def self.most_common_allergen
		#ingredient = Ingredient.new("temp")
		allergen = Allergen.all.reduce do |most_common, current|
			if most_common.ingredient.user_count_allergic_to < current.ingredient.user_count_allergic_to
				most_common = current
			end
			most_common
		end

		allergen.ingredient
		#binding.pry
		#ingredient
	end


	def self.all
		@@all
	end

end

