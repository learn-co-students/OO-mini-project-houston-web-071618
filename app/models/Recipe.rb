class Recipe
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    RecipeCard.all.map(&:recipe).each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }.max_by(&:last)[0]
  end

  def users
    RecipeCard.all.map { |_| _.user if _.recipe == self }.compact
  end

  def ingredients
   RecipeIngredient.all.map { |_| _.ingredients if _.recipe == self }.compact
  end

  def allergens
    Allergen.all.map { |_|
      _.ingredient if _.include?(_.ingredient) }.compact
  end

  def add_ingredients(array)
    array.each { |_| RecipeIngredient.new(_, self) }
  end
end
