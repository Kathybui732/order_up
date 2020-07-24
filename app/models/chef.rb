class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients
    ingredients.uniq
  end

  def most_used_ingredients
    self.ingredients.select('ingredients.*').group('ingredients.id').order('count(ingredients) DESC').limit(3).pluck('ingredients.name')
  end
end
