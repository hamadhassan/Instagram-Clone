class Story < ApplicationRecord
  belongs_to :account
  has_one_attached :image
  def expired?
    Time.now - published_at >= 24.hours
  end
end
