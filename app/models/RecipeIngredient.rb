class RecipeIngredient
  attr_accessor :ingredients, :recipe
  @@all = []

  def initialize(ingredients, recipe)
    @ingredient = ingredients
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end
end
