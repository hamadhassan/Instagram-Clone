# frozen_string_literal: true

class Follower < ApplicationRecord
  # belongs_to :account
  validates_uniqueness_of :follower_id, scope: :following_id
  validates :follower_id, uniqueness: { scope: :following_id }

end
