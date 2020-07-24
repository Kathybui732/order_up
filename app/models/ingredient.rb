class Ingredient < ApplicationRecord

  validates_presence_of :name, :calories

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calorie_count
    sum(:calories)
  end
end
