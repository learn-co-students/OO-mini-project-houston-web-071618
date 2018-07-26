class Recipe
  attr_reader :ingredients, :name
  @@all = []

  def initialize(name="untitled recipe", ingredients)
    @name, @ingredients = name, ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    list_of_allergen_ingredients = Allergen.all.map { |allergen| allergen.ingredient }

    recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      list_of_allergen_ingredients.include?(recipe_ingredient.ingredient)
    end

    recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.ingredient }.uniq
  end

  def self.most_popular
    # binding.pry
    # biggest_number = self.all.map { |recipe| users.length }
    # self.all.find { |recipe| recipe.users.length == biggest_number }
    binding.pry

    self.all.sort_by { |recipe| recipe.users.length }.last
  end

  def users
    RecipeCard.all.select { |recipe_card| recipe_card.recipe == self }
  end

  def add_ingredients(ingredients)
    @ingredients = (@ingredients << ingredients).flatten
  end


end
