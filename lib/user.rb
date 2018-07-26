class User

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    user_recipe_cards = RecipeCard.all.select do |recipe_card_obj|
      recipe_card_obj.user == self
    end

    user_recipe_cards.map {|recipe_card_obj| recipe_card_obj.recipe}
  end

  def add_recipe_card(recipe_obj, date, rating)
    RecipeCard.new(self, recipe_obj, date, rating)
  end

  def declare_allergen(ingredient_obj)
    Allergen.new(self, ingredient_obj)
  end

  def allergens
    Allergen.all.select do |allergen_obj|
      allergen_obj.user == self
    end
  end

  def top_three_recipes
    user_recipe_cards = RecipeCard.all.select do |recipe_card_obj|
      recipe_card_obj.user == self
    end

    user_recipe_cards.sort_by {|recipe_card_obj| recipe_card_obj.rating}.reverse![0..2]
  #   # go through all recipe cards and create hash map for each recipe (recipe obj, avg rating)
  #   deduped_recipe_hash = Hash.new(0)
  #   self.all_recipes.each do |recipe_card_obj|
  #     deduped_recipe_hash[:recipe] = recipe_card_obj.recipe.name
  #     deduped_recipe_hash[:rating_sum] += recipe_card_obj.rating
  #     deduped_recipe_hash[:count] += 1
  #   end
  #
  #   #sort hash map by avg rating
  #
  #   #limit sorted hash map to top three
  #   self.recipes.sort_by do |recipe_obj|
  #
  end

  def most_recent_recipe
    user_recipe_cards = RecipeCard.all.select do |recipe_card_obj|
      recipe_card_obj.user == self
    end

    user_recipe_cards.sort_by {|recipe_card_obj| recipe_card_obj.date}.reverse!.first
  end

  def self.all
    @@all
  end

  def safe_recipes
    #
  end
end
