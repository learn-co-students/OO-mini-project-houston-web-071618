require_relative '../config/environment.rb'

carrot = Ingredient.new("carrot")
flour = Ingredient.new("flour")
egg = Ingredient.new("egg")
walnut = Ingredient.new("walnut")
soy_sauce = Ingredient.new("soy sauce")

carrot_cake = Recipe.new("carrot cake")
salad = Recipe.new("salad")
soba = Recipe.new("soba")
deviled_eggs = Recipe.new("deviled eggs")

carrot_cake.add_ingredients([carrot, flour, egg, walnut])
salad.add_ingredients([carrot, egg, walnut])
deviled_eggs.add_ingredients([egg, walnut])
soba.add_ingredients([soy_sauce])

p "cc ingredients: "
p carrot_cake.ingredients
p "*" * 20
p "soba ingredients: "
p soba.ingredients
p "*" * 20

yuyu = User.new("Yuyu")
alana = User.new("Alana")
zhey = User.new("Zhey")

yuyu.declare_allergen(walnut)
alana.declare_allergen(walnut)
alana.declare_allergen(soy_sauce)
p yuyu.allergens
p alana.allergens

Ingredient.most_common_allergen
p "*" * 20

RecipeCard.new(yuyu, soba, 5)
RecipeCard.new(yuyu, carrot_cake, 4)
RecipeCard.new(zhey, deviled_eggs, 4)
RecipeCard.new(zhey, salad, 4)
RecipeCard.new(alana, soba, 1)
RecipeCard.new(zhey, soba, 3)
RecipeCard.new(zhey, carrot_cake, 5)
p "Most popular recipe: "
p Recipe.most_popular
p "*" * 20


binding.pry
