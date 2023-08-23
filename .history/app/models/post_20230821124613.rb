# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  has_many_attached :images, dependent: :destroy

  belongs_to :account

  before_create :set_active

  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy

  scope :active, -> { where(active: true) }


  private

  def set_active
    self.active = true
  end


    def validate_images
      return if images.count <= 4

      errors.add(:images, 'You can upload max 4 images')
    end
end
