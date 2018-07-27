class Allergen

  attr_accessor :affected_person, :allergic_ingredient
  @@all = []

  def initialize(user, ingredient)
    @affected_person = user
    @allergic_ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end
