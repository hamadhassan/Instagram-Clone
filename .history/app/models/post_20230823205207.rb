# frozen_string_literal: true

# Represents posts created by users in the application.
class Post < ApplicationRecord
  #post order display
  default_scope { order created_at: :desc }
  #assoication
  has_many_attached :images, dependent: :destroy
  belongs_to :account
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  #validation
  validate :validate_images
  validate :image_format
  validate :image_attached

  private

  def validate_images
    return if images.count <= 10

    errors.add(:images, 'You can upload max 10 images')
  end
  def image_format
    if image.attached? && !image.content_type.in?(%w(images/jpeg images/png))
      errors.add("Only JPEG and PNG images are allowed")
    end
  end
  def image_attached
    unless image.attached?
      errors.add(:images, "must be attached")
    end
  end
end
