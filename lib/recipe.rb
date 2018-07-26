class Recipe

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_popular
    most_popular = RecipeCard.all.max_by{|recipe_card_obj| recipe_card_obj.recipe.users.count}

    most_popular.recipe
  end

  def users
    recipecard_array = RecipeCard.all.select do |recipecard_obj|
      recipecard_obj.recipe == self
    end

    recipecard_array.map {|x| x.user}
  end

  def ingredients
    RecipeIngredient.all.select do |recipeingredient_obj|
      recipeingredient_obj.recipe == self
    end
  end

  def allergens
    allergic_recipeingredients = self.ingredients.select do |ingredient_obj|
      ingredient_obj.ingredient.has_allergen?
    end

    allergic_recipeingredients.map {|x| x.ingredient}
  end

  def add_ingredients(ingredient_objs_array)
    ingredient_objs_array.each do |ingredient_obj|
      RecipeIngredient.new(self, ingredient_obj)
    end
  end

  def self.all
    @@all
  end
end
