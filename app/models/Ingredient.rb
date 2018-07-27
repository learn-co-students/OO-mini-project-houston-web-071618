class Ingredient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @all
  end

  def self.most_common_allergen

    counter = Hash.new(0)
    Allergen.all.each do |allergen|
      counter[allergen.allergic_ingredient.name] += 1
    end

    counter.max_by do |allergen, occurence|
      occurence
    end

  end

  def is_allergen?
    !!Allergen.all.find do |allergen|
      allergen.allergic_ingredient == self
    end

    # Opp of nil is true; opp of true is false.
    # First bang (!) coerces the object into a true or false.
    # Second bang (!) flips it.
  end

end
