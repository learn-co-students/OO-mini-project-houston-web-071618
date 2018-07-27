class RecipeCard
  #join between user and recipe instance.
  #a user has many recipes and a receipe has users.
  #the through/join is through the recipe card.
  #you have many to many and the many is the recipe card.
  attr_reader :user, :recipe

  attr_accessor :date, :rating
  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
end
