class Recipe < ActiveRecord::Base
  before_validation :set_id

  private
  def set_id
    self.id = SecureRandom.uuid
  end
end
