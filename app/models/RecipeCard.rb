class RecipeCard
  attr_reader :date, :user, :recipe
  attr_accessor :rating

  @@all = []

  def initialize(user, recipe, rating = nil)
    @user = user
    @recipe = recipe
    @date = Time.now
    @rating = rating if rating > 0 && rating < 6
    @@all << self
  end

  def self.all
    @@all
  end

end
