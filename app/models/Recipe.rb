class Recipe

  @@all = []

  def initialize
    @@all << self
    
  end

  def self.all
    @@all
  end

  def self.most_popular
    blah = Hash.new(0)
    RecipeCard.all.each do |recipe_card|
      blah.key?(recipe_card.recipe) ?
      blah[recipe_card.recipe] += 1 :
      blah[recipe_card.recipe] = 1 
    end
    arr = blah.to_a.sort_by! do |i|
      -i[1]
    end
    arr[0][0]
    end
  end

  def users
    arr = RecipeCard.all.map do |recipe_card|
      recipe_card.user if recipe_card.recipe == self
    end
    arr.compact
  end

  def ingredients
   rec_ing = RecipeIngredient.all.map do |rec|
     rec.ingredients if rec.recipe == self
    end
    rec_ing.compact
  end

  def allergens
    ingred = ingredients
    allergens = Allergen.all.map do |x|
      x.ingredient if ingred.include?(x.ingredient)
    end
    allergens.compact
  end

  def add_ingredients(array)
    array.each do |arr|
      RecipeIngredient.new(arr, self)
    end
  end
end
