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

  def add_ingredients(ingredients)
      ingredients.each do |ingredient|
      RecipeIngredient.new(self,ingredient)
    end
  end

  def ingredients
    ingredients = RecipeIngredient.all.select do |instance|
      instance.recipe == self
    end

    ingredients.map do |ingr|
      ingr.ingredient
    end

  end

  def recipe_users
    rcs = RecipeCard.all.select do |rc|
      rc.recipe == self
    end

    rcs.map do |rc|
      rc.user
    end

  end

  def find_allergens
    ingredients.select do | ingredient |
        ingredient.is_allergen?
    end

      ## .find returns nil if the item in search was absent.
      ## .select returns empty if the condition to be met was "false."

      #(ingredients) & (Allergen.all.map do |allergen| allergen.ingredient end)
  end

  def self.most_popular

    counter = Hash.new(0)

    RecipeCard.all.each do |rc|
      counter[rc.recipe.name] += 1
    end

    counter.max_by do |recipe, occurence|
      occurence
    end

  end

end
