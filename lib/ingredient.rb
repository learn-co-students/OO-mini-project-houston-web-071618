class Ingredient

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    #find out how many users are have X ingredient as allergen
    hash = Hash.new(0)
    Allergen.all.each do |allergen_obj|
      hash[allergen_obj.ingredient] += 1
    end

    hash.max_by do |allergen_obj, count|
      count
    end
  end

  def has_allergen?
    allergen_list = Allergen.all.select do |allergen_obj|
      allergen_obj.ingredient == self
    end

    allergen_list.count > 0
  end

  def self.all
    @@all
  end
end
