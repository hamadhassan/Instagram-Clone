# frozen_string_literal: true

class Account < ApplicationRecord
  attr_accessor :password_confirmation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true

  has_one_attached :image, dependent: :destroy
  has_many :posts,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stories, dependent: :destroy
  def full_name
    "#{first_name}" "#{last_name}"
  end

  def total_followers
    Follower.where(follower_id: id).count
  end

  def total_following
    Follower.where(following_id: id).count
  end

  def likes?(post)
    likes.exists?(post: post, liked: true)
  end
end
