class User
	attr_reader :name

	@@all = []


	def initialize(name)
		@name = name
		@@all << self
	end

	def allrecipecards#get all recipe cards belonging to user
		RecipeCard.all.select do |card|
			card.user == self
		end
	end


	def recipes
		allrecipecards.map do |card|
			card.recipe
		end
	end

	def add_recipe_card(recipe, date, rating)
		RecipeCard.new(self, recipe, date, rating)
	end

	def declare_allergen(ingredient)
		Allergen.new(self, ingredient)
	end

	def allergens
		alle = Allergen.all.select do |allergen|
			allergen.user == self
		end

		alle.map do |alle|
			alle.ingredient
		end
	end

	def top_three_recipes
		sortedcards = allrecipecards.sort_by do|recipecard|
			recipecard.rating
		end

		sortedcards.slice(0,3).map do |card|
			card.recipe
		end
	end

	def most_recent_recipe
		recipes.last
	end


	def self.all
		@@all
	end


	# def safe_recipes
	# end

end
