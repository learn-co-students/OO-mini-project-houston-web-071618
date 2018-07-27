class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.affected_person == self
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def recipe_cards

    RecipeCard.all.select do |card|
      card.user == self
    end
  end

  def recipes

    recipe_cards.map do |rc|
        rc.recipe
      end

  end

  def top_three_recipes

    ordered_cards = recipe_cards.sort_by do |rc|
      rc.rating
    end

    top_cards = ordered_cards.reverse.slice(0..2)

    top_cards.map do |card|
      card.recipe
    end

      # [ cards[0].recipe, cards[1].recipe, cards[2].recipe ]
  end

  def most_recent_recipe
    dates = recipe_cards.map do |rc|
      rc.date
    end

    dates.sort.last
  end

end
