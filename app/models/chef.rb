class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    self.dishes.joins(:ingredients).pluck('ingredients.name').uniq
  end
end
