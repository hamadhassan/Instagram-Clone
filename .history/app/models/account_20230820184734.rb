# frozen_string_literal: true

class Account < ApplicationRecord
  attr_accessor :password_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :username, presence: true, uniqueness: true

  has_one_attached :image
  has_many :posts
  has_many :likes

  def full_name
    "#{first_name}" "#{last_name}"
  end

  def total_followers
    Follower.where(follower_id: id).count
  end

  def total_following
    Follower.where(following_id: id).count
  end
end
