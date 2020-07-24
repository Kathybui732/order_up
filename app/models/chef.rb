class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    self.dishes.joins(:ingredients).pluck('ingredients.name').uniq
  end

  # def most_used_ingredients
  #   chef.dishes.joins(:ingredients).group('ingredients.name').order('count(ingredients.name) desc').limit(3).count('ingredients.name')
  # end
end
