class Ingredient < ApplicationRecord

  validates_presence_of :name, :calories

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calorie_count
    sum(:calories)
  end

  def self.used_by(chef_id)
    Ingredient.joins(:dishes).where('dishes.chef_id = chef_id').pluck('ingredients.name').uniq
  end
end
