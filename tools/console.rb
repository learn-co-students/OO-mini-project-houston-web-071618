require_relative "../config/environment.rb"

#Users
kelly = User.new("kelly")
kevin = User.new("Kevin")
hamzah = User.new("Hamzah")
greg = User.new("Greg")
macy = User.new("Macy")

#Recipe
pizza_recipe = Recipe.new("Pizza")
hummus_recipe = Recipe.new("Hummus")
spaghetti_recipe = Recipe.new("Spaghetti")
pbandj_recipe = Recipe.new("PBJ")

#Ingredient
beef_ingredient = Ingredient.new("Beef")
pasta_ingredient = Ingredient.new("Pasta")
chicken_ingredient = Ingredient.new("Chicken")
cheese_ingredient = Ingredient.new("Cheese")
chickpeas_ingredient = Ingredient.new("Chickpeas")
peanut_ingredient = Ingredient.new("peanuts")
jelly_ingredient = Ingredient.new("jelly")

#Allergen
kelly.declare_allergen(pasta_ingredient)
kelly.declare_allergen(peanut_ingredient)
greg.declare_allergen(cheese_ingredient)
macy.declare_allergen(cheese_ingredient)

#RecipeCard
#def add_recipe_card(recipe, date, rating)
kelly.add_recipe_card(spaghetti_recipe, 1, 4)
macy.add_recipe_card(pbandj_recipe, 1, 4)
greg.add_recipe_card(pizza_recipe, 1, 1)
hamzah.add_recipe_card(pizza_recipe, 2, 4)
hamzah.add_recipe_card(pizza_recipe, 3, 5)

RecipeCard.all
kelly.allergens
macy.allergens
greg.allergens

greg.add_recipe_card(hummus_recipe, 6, 7)

Ingredient.most_common_allergen
Recipe.most_popular

hummus_recipe.add_ingredients([chickpeas_ingredient, beef_ingredient])
binding.pry
