require_relative '../config/environment.rb'

#
# recipeIngredient = RecipeIngredient.new(ingredients, recipe)

ingredients = Ingredient.new("pepper")
salt = Ingredient.new("salt")

user = User.new("Rick")
user2 = User.new("Kenny")
allergens = Allergen.new(user, ingredients)


# recipe = Recipe.new(ingredients, allergens)
# recipe4 = Recipe.new(salt, allergens)
spaghetti = Recipe.new("sphaghetti")

recipeCard1 = RecipeCard.new("7/26/18", 10, user, spaghetti)
recipeCard2 = RecipeCard.new("12/26/17", 8, user, spaghetti)
recipeCard3 = RecipeCard.new("11/26/17", 7, user, spaghetti)
recipeCard4 = RecipeCard.new("10/26/17", 6, user2, spaghetti)

Ingredient.most_common_allergen


user2.add_recipe_card("3/3/18", 2, recipe)
user2.declare_allergen("Peanuts")

user.top_three_recipes
user.recipes
user.allergens
user.most_recent_recipe
binding.pry
recipe4.allergens
recipe4.users
