class User
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select { |_| _.user == self }
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |_| _.user == self }
  end

  def top_three_recipes
    recipes.sort_by { |x| -x.rating }[0..2]
  end

  def most_recent_recipe
    recipes[-1]
  end
end
