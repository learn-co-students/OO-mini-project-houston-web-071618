
class Ingredient
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    Ingredient.all << self
  end

  def self.all
    @@all
  end

  def user_count_allergic_too
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end.count
  end

  def self.most_common_allergen
    Allergen.all.reduce(Allergen.all.first.ingredient) do |most_common, current|
      if (most_common.user_count_allergic_too < current.ingredient.user_count_allergic_too)
        most_common = current.ingredient
      end
      most_common
    end
  end

end
