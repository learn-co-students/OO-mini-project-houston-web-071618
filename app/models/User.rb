class User

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    User.all << self
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
      recipe_card.recipe
    end

  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self,ingredient)
  end

  def allergens
    user_allergens = Allergen.all.select do |allergen|
      allergen.user == self
    end

    user_allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    sorted_recipes = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end

    sorted_recipes.slice(0, 3).map do |recipe_card|
      recipe_card.recipe
    end

  end

  def most_recent_recipe
    recipes.last
  end


end
