class Recipe
  #accessors are only for instance variables.
  @@all = []

  def initialize(ingredients)
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    most_popular = Hash.new(0)
    RecipeCard.all.each do |recipe_card|
      most_popular[recipe_card.recipe] += 1
    end
    most_popular.max_by { |key, value| value }
  end

  #another way:
  # def self.most_popular
  #   RecipeCard.all.reduce(RecipeCard.all.first.recipe) do |most_popular, current_recipe|
  #     #binding.pry
  #     if most_popular.users.count < current_recipe.recipe.users.count
  #       most_popular = current_recipe.recipe
  #     end
  #     most_popular
  #   end
  # end

  def users
    temp = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
    temp.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    temp = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
    temp.map do |recipe|
      recipe.ingredient
    end
  end

  def allergens
    Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  #for every class, delcare initialization and functions;
  #for linking class, you pass in those classes and store them.
  #you pass them in through initialization.
end
