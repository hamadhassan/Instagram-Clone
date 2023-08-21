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
    if input >= 0 && input < self.images.length
    return self.images[input].variant(resize: "300x300").processed
    end
  end

  private

  def set_active
    self.active = true
  end
end
