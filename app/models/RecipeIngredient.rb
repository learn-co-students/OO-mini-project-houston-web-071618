class RecipeIngredient
  attr_accessor :ingredient, :recipe
  @@all = []
  #when you have a join table or class you feed it the two instances it's joining.
  def initialize(ingredient, recipe)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
