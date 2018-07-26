class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    user_allergens = Allergen.all.select do |allergen|
      allergen.user == self
    end
    user_allergens.map do |ingredient|
      allergen.ingredient
    end
  end

  def top_three_recipes
  end
end
