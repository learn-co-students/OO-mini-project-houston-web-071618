class Recipe
	@@all = []

	attr_accessor :recipename


	def initialize(recipename)
		@recipename = recipename
		@@all << self
	end



	def allrecipecards#get all recipe cards belonging to recipe
		RecipeCard.all.select do |card|
			#binding.pry
			card.recipe == self
		end
	end

	def users
		allrecipecards.map do |card|
			#binding.pry
			card.user
		end
	end

	def allrecinc
		RecipeIngredient.all.select do |recinc|
			recinc.recipe == self
		end
	end


	def ingredients
		allrecinc.map do |inclist|
			inclist.ingredient
		end
	end

	def allergens
		#ingredients


		#(ingredients) & (Allergen.all.map{|allergen| allergen.ingredient})

		ingredients.all.select do |ingredient|
			Allergen.all.reduce(false) do |result, allergen|
				if allergen.ingredient == ingredient
					result = true
				end

				result
			end
		end

	end

	def add_ingredients(ingredients)
		ingredients.each do |ingredient|
			RecipeIngredient.new(self, ingredient)
		end
	end

	def self.all
		@@all
	end

	def self.most_popular
		card = RecipeCard.all.reduce do |most_popular, current_recipe|
			#binding.pry
			if most_popular.recipe.users.count < current_recipe.recipe.users.count
				most_popular = current_recipe
			end
			most_popular
		end
		card.recipe
	end


end
