require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    before :each do
      @chef = Chef.create(name: "Kathy")
      @dish_1 = @chef.dishes.create(name: "Pizza", description: "Hawaiian Pizza")
      @dish_2 = @chef.dishes.create(name: "Pasta", description: "With italian sausage")
      @dish_3 = @chef.dishes.create(name: "Calzone", description: "With italian sausage")
      @ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
      @ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
      @ingredient_3 = Ingredient.create(name: "Italian_sausage", calories: 700)
      @ingredient_4 = Ingredient.create(name: "Pasta", calories: 700)
      DishIngredient.create(ingredient: @ingredient_1, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_2, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_3, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_4, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_1, dish: @dish_2)
      DishIngredient.create(ingredient: @ingredient_2, dish: @dish_2)
      DishIngredient.create(ingredient: @ingredient_3, dish: @dish_2)
      DishIngredient.create(ingredient: @ingredient_1, dish: @dish_3)
      DishIngredient.create(ingredient: @ingredient_2, dish: @dish_3)
    end

    it "#all_ingredients" do
      ingredients = [@ingredient_1.name, @ingredient_2.name, @ingredient_3.name, @ingredient_4.name].sort
      expect(@chef.all_ingredients.sort).to eq(ingredients)
    end

    it "#most_used_ingredients" do
      ingredients = [@ingredient_1.name, @ingredient_2.name, @ingredient_3.name].sort
      expect(@chef.most_used_ingredients.sort).to eq(ingredients)
    end
  end
end
