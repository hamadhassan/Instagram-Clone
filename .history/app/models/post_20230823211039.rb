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
  validate :images_formats
  validate :images_attached

  private

  def validate_images
    return if images.count <= 10

    errors.add(:images, 'You can upload max 10 images')
  end
  def images_formats
    if images.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:images, "Only JPEG and PNG images are allowed")
    end

  end
  def images_attached
    if images.blank? || images.all? { |image| !image.attached? }
      errors.add(:images, "must be attached")
    end
  end
end
