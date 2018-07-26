class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.ingredient == self
    end
  end

  def self.all
    @@all
  end
end
