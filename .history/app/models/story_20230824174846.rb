# frozen_string_literal: true

# Represents stories created by users in the application.
class Story < ApplicationRecord
  #association
  belongs_to :account
  has_one_attached :image
  # Validations
  validate :image, presence: true
  validate :image_format

  private

  def image_format
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, "Only JPEG and PNG images are allowed")
    end
  end
end
