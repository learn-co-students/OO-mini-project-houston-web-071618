class RecipeCard
  attr_reader :date, :rating, :user, :recipe
  @@all = []

  def initialize(date, user, recipe, rating)
    @date, @user, @recipe, @rating = date, user, recipe, rating
    @@all << self
  end

  def self.all
    @@all
  end

end
