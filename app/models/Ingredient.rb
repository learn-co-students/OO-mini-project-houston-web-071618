class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.ingredient == self
    end
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    new_hash = Hash.new(0)
    Allergen.all.each do |allergen|
      new_hash[allergen.ingredient] += 1
    end
    new_hash.max_by { |key, value| value }[0].name
  end

  #reduce does map and select in one go.
  #reduce |element-element|
  #to find most common allergen, you should grab all the allergens.
  #to count users that have allergens, get an array of the users. To get the number of users do .size or .count.
  #users for 1 specific allergen, which are ingredients.
  #after grabbing list from ingredients, user-count to get the most common allergen. Then use .reduce to compare the current element of the new element to see if user count greater than new element.

  #   def user_count_allergic_to
  #    allergen_ingredient = Allergen.all.select do |allergen|
  #       allergen.ingredient == self
  #     end
  #     allergen_ingredient.count
  #   end

  # def self.most_common_allergen
  #   #ingredient = Ingredient.new(“temp”)
  #   Allergen.all.reduce(Allergen.all.first.ingredient) do |most_common, current|
  #       if most_common.user_count_allergic_to < current.ingredient.user_count_allergic_to
  #           most_common = current.ingredient
  #       end
  #       most_common
  #   end

end
