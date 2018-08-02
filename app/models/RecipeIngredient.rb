class RecipeIngredient

    @@all = []

    attr_reader :recipe, :ingredient
    
    def initialize(ingredient, recipe)
        @ingredient = ingredient
        @recipe = recipe
        @@all << self 
    end


    def self.all 
        @@all 
    end 

end 