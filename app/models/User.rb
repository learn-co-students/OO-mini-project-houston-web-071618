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
    RecipeCard.all.select { |recipe| recipe.user == self }
  end

  def recipes
    recipe_cards.map { |recipe_card| recipe_card.recipe }
  end

  def add_recipe_card(date, recipe, rating)
    RecipeCard.new(date="unknown", self, recipe, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    final_index = 2
    if recipe_cards.length < 3
      final_index = recipe_cards.length - 1
    end

    if recipe_cards.length == 0
      return "No recipes"
    end

    top_three_recipe_cards = recipe_cards.sort_by { |recipe_card| recipe_card.rating }.reverse[0..final_index]

    top_three_recipe_cards.map { |top| top.recipe }
  end

  def most_recent_recipe
    recipes.last
  end

end
