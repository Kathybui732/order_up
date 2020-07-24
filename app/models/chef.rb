class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    self.dishes.joins(:ingredients).distinct.pluck('ingredients.name')
  end

  def most_used_ingredients
    self.dishes.joins(:ingredients).select('ingredients.*').group('ingredients.id').order('count(ingredients) desc').limit(3).pluck('ingredients.name')

    # Other possibilities
    # self.dishes.joins(:ingredients).group('ingredients.name').order('count(ingredients.name) desc').limit(3).count('ingredients.name').keys
    # self.dishes.joins(:ingredients).select('ingredients.name, count(ingredients) as ingredient_count').group('ingredients.id').order('ingredient_count DESC')
  end
end
