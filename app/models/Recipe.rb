class Recipe
  #accessors are only for instance variables.
  @@all = []

  def initialize(ingredients)
    @ingredients = ingredients
    @@all << self
  end

  def Recipe.most_popular
  end

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
end
