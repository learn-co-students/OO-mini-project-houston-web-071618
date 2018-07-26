require_relative '../config/environment.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/user.rb'
require_relative '../lib/ingredient.rb'
require_relative '../lib/allergen.rb'
require_relative '../lib/recipeingredient.rb'
require_relative '../lib/recipe_card.rb'

bobby_flay = User.new("Bobby Flay")
guy_fiere = User.new("Guy Fiere")
gordon_ramsey = User.new("Gordon Ramsey")

lasagna = Recipe.new("Lasagna")
salad = Recipe.new("Salad")
enchiladas = Recipe.new("Enchiladas")
cookie = Recipe.new("Cookie")

best_lasagna = RecipeCard.new(bobby_flay, lasagna, 20180726, 5)
worst_salad = RecipeCard.new(bobby_flay, salad, 19200726, 4)
okay_enchiladas = RecipeCard.new(bobby_flay, enchiladas, 20180505, 3)
amazing_cookie = RecipeCard.new(bobby_flay, cookie, 20180101, 6)
horrible_cookie = RecipeCard.new(gordon_ramsey, cookie, 20190101, 0)

#ingredient
lettuce = Ingredient.new("lettuce")
cheese = Ingredient.new("cheese")
tomato_sauce = Ingredient.new("tomato_sauce")
ground_beef = Ingredient.new("ground_beef")
cookie_dough = Ingredient.new("cookie_dough")
enchilada_sauce = Ingredient.new("enchilada_sauce")
tortillas = Ingredient.new("tortillas")

#add_ingredients
lasagna.add_ingredients(Ingredient.all)
salad.add_ingredients([lettuce, tomato_sauce, cheese])

#allergen
hives = Allergen.new(bobby_flay, cheese)
runny_nose = Allergen.new(guy_fiere, ground_beef)
poop = Allergen.new(gordon_ramsey, ground_beef)

# binding.pry
