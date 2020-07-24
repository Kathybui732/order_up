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
      @ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
      @ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
      DishIngredient.create(ingredient: @ingredient_1, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_2, dish: @dish_1)
      DishIngredient.create(ingredient: @ingredient_1, dish: @dish_2)
      DishIngredient.create(ingredient: @ingredient_2, dish: @dish_2)
    end

    it "#all_ingredients" do
      ingredients = [@ingredient_1.name, @ingredient_2.name]
      expect(@chef.all_ingredients).to eq(ingredients)
    end

    # it "#most_used_ingredients" do
    #   ingredients = [@ingredient_1, @ingredient_2, @ingredient_3]
    #   expect(@chef.most_used_ingredients).to eq(ingredients)
    # end
  end
end
