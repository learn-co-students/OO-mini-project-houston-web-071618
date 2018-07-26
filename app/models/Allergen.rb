class Allergen

  @@all = []

  attr_reader :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    Allergen.all << self
  end

  def self.all
    @@all
  end

end
