require "rails_helper"

RSpec.describe "Dish Show Page" do
  before :each do
    @chef = Chef.create(name: "Kathy")
    @dish_1 = @chef.dishes.create(name: "Pizza", description: "Hawaiian Pizza")
    @ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
    @ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
    DishIngredient.create(ingredient: @ingredient_1, dish: @dish_1)
    DishIngredient.create(ingredient: @ingredient_2, dish: @dish_1)
  end

  it "see a list of ingredients for that dish" do
    visit "/dishes/#{@dish_1.id}"
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end

  it "displays the chef's name" do
    visit "/dishes/#{@dish_1.id}"
    expect(page).to have_content(@chef.name)
  end

  it "the total calorie count for that dish" do
    visit "/dishes/#{@dish_1.id}"
    expect(page).to have_content("Total calorie count: #{@dish_1.ingredients.total_calorie_count}")
  end
end
