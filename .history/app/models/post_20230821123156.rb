# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  has_many_attached :images, dependent: :destroy

  belongs_to :account

  before_create :set_active

  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy

  scope :active, -> { where(active: true) }

  def thumbnail input
    if input.to_i.to_s == input
      input = input.to_i
      # Check if the index is within the bounds of self.images
      if input >= 0 && input < self.images.length
        return self.images[input].variant(resize: "300x300").processed
      end
    end
  end

  private

  def set_active
    self.active = true
  end
end
