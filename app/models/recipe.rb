class Recipe < ActiveRecord::Base

  CATEGORIES = %w(breakfast dinner lunch)

  before_validation :set_id, on: :create

  serialize :properties, RecipeProperties

  scope :by_category, ->(category) { where("'#{category}' = ANY (categories)")}
  scope :by_ingredients, ->(ingredient) { where("'#{ingredient}' = ANY (ingredients)")}
  scope :max_preparation_time, ->(time) { where("properties['preparation_time'] < #{time}")}

  private
  def set_id
    self.id = SecureRandom.uuid
  end
end
