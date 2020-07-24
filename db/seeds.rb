# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef = Chef.create(name: "Kathy")

dish_1 = chef.dishes.create(name: "Pizza", description: "Hawaiian Pizza")
dish_2 = chef.dishes.create(name: "Pasta", description: "With italian sausage")

ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
ingredient_3 = Ingredient.create(name: "Italian_sausage", calories: 700)

DishIngredient.create(ingredient: ingredient_1, dish: dish_1)
DishIngredient.create(ingredient: ingredient_2, dish: dish_1)
DishIngredient.create(ingredient: ingredient_1, dish: dish_2)
DishIngredient.create(ingredient: ingredient_2, dish: dish_2)
