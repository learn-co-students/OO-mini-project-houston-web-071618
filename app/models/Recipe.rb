class Recipe

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    Recipe.all << self
  end

  def self.all
    @@all
  end


  def self.most_popular
    RecipeCard.all.reduce(RecipeCard.all.first.recipe) do |most_popular, current_recipe|
      if most_popular.users.count < current_recipe.recipe.users.count
        most_popular = current_recipe
      end
      most_popular
    end

  end

  def all_recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    all_recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
    recipe_ingredients.map do |ingredients|
      ingredients.ingredient
    end
  end

  def allergens
    (ingredients) & (Allergen.all.map{|allergen| allergen.ingredient})
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end

  end

end
