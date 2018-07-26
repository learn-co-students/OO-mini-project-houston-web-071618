require_relative '../config/environment.rb'


humzah = User.new("Humzah")
graham = User.new("Graham")
michael = User.new("Michael")

sugar = Ingredient.new("sugar")
spice = Ingredient.new("spice")
everything_nice = Ingredient.new("everything nice")

humzah_allergen = Allergen.new(humzah, everything_nice)
graham_allergen = Allergen.new(graham, spice)
michael_allergen = Allergen.new(michael, sugar)

pizza = Recipe.new("pizza", [everything_nice, sugar])
tacos = Recipe.new("tacos", [spice, sugar])
cake = Recipe.new("cake", [spice])
mac_and_cheese = Recipe.new("mac and cheese", [sugar])

pizza_recipe_card = RecipeCard.new("07/26/18", humzah, pizza, 5)
tacos_recipe_card = RecipeCard.new("07/16/20", humzah, tacos, 11)
cake_recipe_card = RecipeCard.new("01/20/80", michael, cake, 6)

pizza_recipe_ingredient_1 = RecipeIngredient.new(pizza, everything_nice)
pizza_recipe_ingredient_2 = RecipeIngredient.new(pizza, sugar)
tacos_recipe_ingredient_1 = RecipeIngredient.new(tacos, spice)
tacos_recipe_ingredient_2 = RecipeIngredient.new(tacos, sugar)
cake_recipe_ingredient_1 = RecipeIngredient.new(cake, sugar)

michael.add_recipe_card("1/1/1", pizza, 2)
graham.add_recipe_card("11/11/11", tacos, 2)
michael.add_recipe_card("1/1/1", pizza, 2)
# Recipe.most_popular

binding.pry
