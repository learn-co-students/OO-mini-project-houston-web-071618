class Ingredient
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    Allergen.all.map(&:ingredient).each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }.max_by(&:last)[0]
  end
end
