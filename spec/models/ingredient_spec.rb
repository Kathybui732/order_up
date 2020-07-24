require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end

  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  describe "methods" do
    it "#total_calorie_count" do
      ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
      ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
      expect(Ingredient.total_calorie_count). to eq(900)
    end

    it "used_by" do
      chef = Chef.create(name: "Kathy")
      dish_1 = chef.dishes.create(name: "Pizza", description: "Hawaiian Pizza")
      dish_2 = chef.dishes.create(name: "Pasta", description: "With italian sausage")
      ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
      ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
      DishIngredient.create(ingredient: ingredient_1, dish: dish_1)
      DishIngredient.create(ingredient: ingredient_2, dish: dish_1)
      DishIngredient.create(ingredient: ingredient_1, dish: dish_2)
      DishIngredient.create(ingredient: ingredient_2, dish: dish_2)
      ingredients = [ingredient_1.name, ingredient_2.name]
      expect(Ingredient.used_by(chef.id)).to eq(ingredients)
    end
  end
end
