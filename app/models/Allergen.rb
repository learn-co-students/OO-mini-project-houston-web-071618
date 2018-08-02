class Allergen

    @@all = []

    attr_reader :ingredient, :user 

    def initialize(user, ingredient)
        @user = user 
        @ingredient = ingredient
        @@all << self 
    end

    def self.all 
        @@all 
    end

end 