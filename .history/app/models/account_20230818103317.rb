# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached:image
  has_many :followers, foreign_key: 'following_id', class_name: 'Follower'
  has_many :posts
  has_many :likes

  def full_name
    "#{first_name}" "#{last_name}"
  end
  def total_followers
    0
  end
  def total_following
    0
  end
end
