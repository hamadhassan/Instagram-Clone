# frozen_string_literal: true

# Represents user accounts in the application.
class Account < ApplicationRecord
  include PgSearch::Model
  attr_accessor :password_confirmation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validation
  validates :username, presence: true, uniqueness: true
  validate :image_format
  #assoication
  has_one_attached :image, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :followers, class_name: 'Follower', foreign_key: 'following_id'
  pg_search_scope :search_by_username_and_email, against: %i[username email]

  def total_followers
    Follower.where(follower_id: id).count
  end

  def total_following
    Follower.where(following_id: id).count
  end

  def likes?(post)
    likes.exists?(post:, liked: true)
  end

  private

  def image_format
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, "Only JPEG and PNG images are allowed")
    end
  end
end
