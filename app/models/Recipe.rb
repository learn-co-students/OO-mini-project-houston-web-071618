class Recipe
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients
    
  end
  # def self.most_popular
  #   most_popular = self.all.max_by do |recipe|
  #     recipe.
  #   end
  #   most_popular
  # end

  def recipe_cards
     RecipeCard.all.select do |recipeCard|
      recipeCard.recipe == self
    end
  end

  def users
    recipe_cards.map do |recipe_card|
    recipe_card.user
    end
  end




end
