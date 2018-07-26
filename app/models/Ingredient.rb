# INGREDIENT Build the following methods on the Ingredient class

# Ingredient.all should return all of the ingredient instances
# Ingredient.most_common_allergen should return the ingredient instance that
# the highest number of users are allergic to

require "pry"
class Ingredient

	@@all = []

	attr_reader :name

	def initialize(name)
		@name = name
	end

	def self.all 
		@@all 
	end

	def self.most_common_allergen
		most_allergen = Hash.new(0)
		Allergen.all.each do |allergy|
		   	most_allergen[allergy.ingredient.name] += 1
		end

		most_allergen.max_by{|k,v| v}

	end



end
