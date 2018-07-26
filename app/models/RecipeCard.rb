class RecipeCard
  #join between user and recipe instance.
  #a user has many recipes and a receipe has users.
  #the through/join is through the recipe card.
  #you have many to many and the many is the recipe card.
  attr_accessor :rating, :recipe
  attr_reader :date, :user
  @@all = []

  def initialize(date, rating, user, recipe)
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
