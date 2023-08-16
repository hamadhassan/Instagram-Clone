class Post < ApplicationRecord
  has_one_attached:image
  belongs_to :account
  before_create :set_active

  scope :active, -> { where(active: true) }

  def total_likes
    
  end
  private
  def set_active
    self.active=true
  end
end
