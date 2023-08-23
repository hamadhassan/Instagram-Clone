# frozen_string_literal: true

class Follower < ApplicationRecord
  # belongs_to :account
  validates :follower_id, uniqueness: { scope: :following_id }

end
