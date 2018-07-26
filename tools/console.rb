require_relative '../config/environment.rb'


# =====================Users===================
pablo = User.new("pablo")
sean = User.new("sean")
hanzah = User.new("hanzah")
michael = User.new("michael")
graham = User.new("graham")
#=====================Recipe=====================
chicken_stir_fry = Recipe.new("chicken")
pasta = Recipe.new("pasta")
pizza = Recipe.new("pizza")
#====================ingredients================
chicken = Ingredient.new("chicken")
noodles = Ingredient.new("noodles")
pepperoni = Ingredient.new("pepperoni")
#============allergies======
pablo.declare_allergen(pepperoni)
sean.declare_allergen(noodles)
sean.declare_allergen(pepperoni)

pablo.add_recipe_card(pasta, 1, 5)
sean.add_recipe_card(pasta, 1, 4)
sean.add_recipe_card(pizza, 1, 3)

binding.pry

false
