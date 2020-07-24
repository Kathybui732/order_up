require "rails_helper"

RSpec.describe "Chef's Show Page" do
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

  it "displays the name of that chef" do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content(@chef.name)
  end

  it "a link to view a list of all ingredients that this chef uses in their dishes" do
    visit "/chefs/#{@chef.id}"
    click_on "Chef's Ingredients"
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@ingredient_1.name, count: 1)
    expect(page).to have_content(@ingredient_2.name, count: 1)
    expect(page).to have_content(@ingredient_3.name, count: 1)
    expect(page).to have_content(@ingredient_4.name).once #both work
  end

  it "the three most popular ingredients that the chef uses in their dishes" do
    dish_3 = @chef.dishes.create(name: "Calzone", description: "With italian sausage")
    ingredient_4 = Ingredient.create(name: "Pasta", calories: 700)
    DishIngredient.create(ingredient: @ingredient_2, dish: @dish_2)
    DishIngredient.create(ingredient: @ingredient_1, dish: dish_3)
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content("Most Used Ingredients: #{@ingredient_1.name} #{@ingredient_2.name} #{@ingredient_3.name}")
  end
end
