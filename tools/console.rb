require_relative "../config/environment.rb"

kelly = User.new("kelly")
peanut_ingredient = Ingredient.new("peanuts")

peanuts_allergen = Allergen.new(kelly, peanut_ingredient)

jelly_ingredient = Ingredient.new("jelly")
pbandj_recipe = Recipe.new(peanut_ingredient)
recipe_ingredient = RecipeIngredient.new(peanut_ingredient, pbandj_recipe)
recipe1 = RecipeCard.new("09/21/17", 4, kelly, pbandj_recipe)

binding.pry
