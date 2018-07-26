require_relative '../config/environment.rb'



# Users
cindy = User.new("Cindy")
erica = User.new("Erica")
marylene = User.new("Marylene")

# Recipes
choc_mousse = Recipe.new("Chocolate Mousse")
chickyparm = Recipe.new("Chicken Parmesan")
seafood_pasta = Recipe.new("Seafood Pasta")
pbj = Recipe.new("PB&J")



# RecipeCards
marylene.add_recipe_card(chickyparm, 0, 7)
erica.add_recipe_card(seafood_pasta, 0, 9)
marylene.add_recipe_card(choc_mousse, 0, 10)
cindy.add_recipe_card(choc_mousse, 0, 10)
cindy.add_recipe_card(pbj, 0, 9)
marylene.add_recipe_card(pbj, 0, 8)
erica.add_recipe_card(pbj, 0, 8)
marylene.add_recipe_card(seafood_pasta, 0, 3)


#Ingredients
egg = Ingredient.new("Egg")
chocolate = Ingredient.new("Chocolate")
peanut = Ingredient.new("Peanut")
pasta = Ingredient.new("Pasta")
chicken = Ingredient.new("Chicken")
jelly = Ingredient.new("Jelly")
bread = Ingredient.new("Bread")
seafood = Ingredient.new("Seafood")


#Allergens
marylene.declare_allergen(peanut)
cindy.declare_allergen(peanut)
marylene.declare_allergen(seafood)


binding.pry

puts "hello world!"

