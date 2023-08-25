# frozen_string_literal: true

# Represents stories created by users in the application.
class Story < ApplicationRecord
  #association
  belongs_to :account
  has_one_attached :image
  #valiation
  validate :image_format
  validate :image_attachment

  private

  def image_format
    bu
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, "Only JPEG and PNG image are allowed")
    end
  end
  def image_attachment
    byebug
    if image.attached? == false
      errors.add(:image, "must be attached")
    end
  end
end
