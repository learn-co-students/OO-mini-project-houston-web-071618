class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    counter = Hash.new(0)
    Allergen.all.each do |allergen|
      counter[allergen.ingredients.name] += 1
    end
    counter.max_by do |allergen, occurence|
      occurence
            binding.pry
    end
  end

  
  # def is_allergen?
  #   !!Allergen.all.find do |allergen|
  #     allergen.ingredients == self
  #   end
  # end


end
