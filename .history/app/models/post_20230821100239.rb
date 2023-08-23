# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  has_one_attached :image

  belongs_to :account

  before_create :set_active

  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy

  scope :active, -> { where(active: true) }

  private

  def set_active
    self.active = true
  end
end
