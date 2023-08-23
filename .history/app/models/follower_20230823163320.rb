# frozen_string_literal: true

# Represents the relationships between users following each other in the application.
class Follower < ApplicationRecord
  # belongs_to :account
  validates :follower_id, uniqueness: { scope: :following_id }
  belongs_to :account

end
