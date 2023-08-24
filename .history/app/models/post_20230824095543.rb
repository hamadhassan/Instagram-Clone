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
  validate :images_type
  validate :images_presense
  validates :image, presence: true

  private

  def validate_images
    return if images.count <= 10
    errors.add(:images, 'You can upload max 10 images')
  end

  def images_type
    images.each do |image|
      if !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:images, "Only JPEG and PNG images are allowed")
      end
    end
  end
  def images_presense
    if images.attached? == false
      errors.add(:images, "must be attached")
    end
  end
end
