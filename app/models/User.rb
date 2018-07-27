class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
     RecipeCard.all.select do |recipeCard|
      recipeCard.user == self
    end
  end

  def recipes
    recipe_cards.map do |recipe_card|
    recipe_card.recipe
    end
  end

  def add_recipe_card(date, rating, recipe)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    recipes.map do |recipe_card|
      recipe_card.allergens
    end
  end

  def top_three_recipes
    recipe_cards.map do |recipe|
      recipe.rating
    end.sort.reverse[0,3]
  end

  def most_recent_recipe
    recipes.last
  end

end
