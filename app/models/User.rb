class User

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end

    def recipes
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self 
        end 
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self 
        end 
    end

    def top_three_recipes
        arr = self.recipes
        x = arr.sort_by {|recipe| recipe.rating}
        x.last(3)
    end

    def most_recent_recipe
        self.recipes.last
    end

    def self.all
        @@all 
    end

end 