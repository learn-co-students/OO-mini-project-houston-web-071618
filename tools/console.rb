require_relative '../config/environment.rb'

# ------INGREDIENTS------
pb = Ingredient.new("peanut butter")
jelly = Ingredient.new("jelly")
milk = Ingredient.new("milk")
cereal = Ingredient.new("cereal")
bread = Ingredient.new("bread")
honey = Ingredient.new("honey")

# ------USERS------
derek = User.new("Derek")
ryhan = User.new("Ryhan")
humzah = User.new("Humzah")
pablo = User.new("Pablo")

# ------Recipes------
apple_jacks = Recipe.new("Apple Jacks")
pb_and_j = Recipe.new("PB&J")

# ------RecipeIngredients------
pb_and_j_one = RecipeIngredient.new(pb, pb_and_j)
pb_and_j_two = RecipeIngredient.new(jelly, pb_and_j)
apple_jacks_one = RecipeIngredient.new(milk, apple_jacks)
apple_jacks_two = RecipeIngredient.new(cereal, apple_jacks)

# ------Allergens------
humzah_allergen_one = Allergen.new(humzah, pb)
pablo_allergen = Allergen.new(pablo, milk)
humzah_allergen_two = Allergen.new(humzah, milk)

# ------RecipeCards------
ryhan_apple_jacks = RecipeCard.new(ryhan, apple_jacks, "1/10", 10)
humzah_apple_jacks = RecipeCard.new(humzah, apple_jacks, "2/12", 7)
ryhan_pbj = RecipeCard.new(ryhan, pb_and_j, "3/22", 6)
humzah_pbj = RecipeCard.new(humzah, pb_and_j, "5/1", 4)
humzah_pbj_two = RecipeCard.new(humzah, pb_and_j, "5/2", 10)
humzah_apple_jacks_two = RecipeCard.new(humzah, apple_jacks, "6/25", 9)


binding.pry
