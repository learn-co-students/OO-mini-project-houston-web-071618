class Recipe

    @@all = []

    def initialize(dish)
        @dish = dish 
        @@all << self 
    end

    def find_recipe_cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self 
        end 
    end

    def users
        find_recipe_cards.map do |recipe_card|
            recipe_card.user
        end
    end

    def ingredients
        x = RecipeIngredient.all.select do |recipe_ingredient|
            binding.pry 
            recipe_ingredient.recipe == self 
        end 
        x.map do |i|
            i.ingredient
        end 
    end

    def allergens
       Allergen.all.select do |allergen|
            self.ingredients.include?(allergen.ingredient)
       end 
    end 

    def add_ingredients(ingredients)
        ingredients.each do |i|
            RecipeIngredient.new(i, self)
        end 
    end

    def self.most_popular
        recipe_count = Hash.new(0)
        RecipeCard.all.each do |recipe_card|
            recipe_count[recipe_card.recipe] += 1
        end 
        recipe_count.max_by{|k,v| v}
    end

    def self.all
        @@all 
    end

end
