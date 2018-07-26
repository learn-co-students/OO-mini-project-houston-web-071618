class RecipeIngredient

  @@all = []

  attr_reader :ingredient, :recipe

  def initialize(ingredient, recipe)
    @ingredient = ingredient
    @recipe = recipe
    RecipeIngredient.all << self
  end

  def self.all
    @@all
  end

end
