require_relative '../config/environment.rb'

#binding.pry


#users
pablo = User.new("Pablo")
sean = User.new("Sean")
hanzah = User.new("Hanzah")
michael = User.new("Michael")
graham = User.new("Graham")


#Recipe
chicken_shit = Recipe.new("Chicken Shit")
pasta = Recipe.new("Pasta")
pizza = Recipe.new("Pizza")

#Ingredients
chicken = Ingredient.new("Chicken")
noodles = Ingredient.new("Noodles")
pepperoni = Ingredient.new("Pepperoni")


#Allergen
pablo.declare_allergen(pepperoni)
sean.declare_allergen(noodles)
sean.declare_allergen(pepperoni)

#binding.pry

#RecipeCard
pablo.add_recipe_card(pasta, 1, 5)
sean.add_recipe_card(chicken_shit, 1, 5)
sean.add_recipe_card(pasta, 1, 1)

RecipeCard.all
pablo.allergens
sean.allergens
pablo.top_three_recipes

sean.add_recipe_card(chicken_shit, 2, 10)

Ingredient.most_common_allergen
Recipe.most_popular

chicken_shit.add_ingredients([chicken,pasta])
chicken_shit.ingredients

#binding.pry
#sean.most_recent_recipe



#RecipeIngredient
