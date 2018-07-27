class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards #this gets all recipe cards that belong to the user.
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    user_allergens = Allergen.all.select do |allergen|
      allergen.user == self
    end
    user_allergens.map do |user_allergens|
      user_allergens.ingredient
    end
  end

  def top_three_recipes
    #sort recipes. Set that to variable top recipes and do .last 3 to return last 3.
    #get list of recipes, sort them by rating (recipes.rating), then grab the first 3: grab[0..2]
    sorted_recipe_cards = recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end
    sorted_recipe_cards.(0..2).map do |card|
      card.recipe
    end
  end

  #another way:

  # def top_three_recipes #sorts recipe cards by rating and orders them by rating using the sort_by method. sort_by sorts from low to high by default:
  #   #given the following array: [5, 1, 2], [5, 1, 2].sort_by{ |i| i } will return [1,2,5].
  #   sorted_recipe_cards = recipe_cards.sort_by do |recipe_card|
  #     recipe_card.rating
  #   end

  #   #this will take the sorted cards declared above and perform the slice method: array.slice(start, length) -> an_array or nil. The slice from (0,3) is selecting the first 3 recipes from the sorted top recipes array. Array#slice lets you pull out a subset of an array based on a range of indices. We are then mapping over them to transform the array to return the recipes of those cards.
  #   sorted_recipe_cards.slice(0, 3).map do |card|
  #     card.recipe
  #   end
  # end

  def most_recent_recipe
    #pull array from recipe and pull from last
    recipes.last
  end
end
