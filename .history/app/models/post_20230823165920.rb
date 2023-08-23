# frozen_string_literal: true

# Represents posts created by users in the application.
class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  has_many_attached :images, dependent: :destroy

  belongs_to :account

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :active, -> { where(active: true) }

  validate :validate_images

  private

  def validate_images
    return if images.count <= 10

    errors.add(:images, 'You can upload max 10 images')
  end
end
