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
    before :each do
      @ingredient_1 = Ingredient.create(name: "Marinara sauce", calories: 300)
      @ingredient_2 = Ingredient.create(name: "Mozzerella", calories: 600)
    end
    it "#total_calorie_count" do
      expect(Ingredient.total_calorie_count). to eq(900)
    end
  end
end
