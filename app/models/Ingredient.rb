class Ingredient
  @@all = []
  
  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    blah = Hash.new(0)
    Allergen.all.each do |allergen|
      blah.key?(allergen.ingredient) ?
      blah[allergen.ingredient] += 1 :
      blah[allergen.ingredient] = 1 
    end
    arr = blah.to_a.sort_by do |i|
      -i[1]
    end
    arr[0][0]
  end
end
