class Allergen
  attr_accessor :users, :ingredients
  @@all = []

  def initialize(users, ingredients)
    @users = users
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end
end
