class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all =[]

  def initialize(date, rating = 0, user, recipe)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end



end
